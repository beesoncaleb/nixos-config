{
  description = "General use case development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # Get all project shell directories autmatically
    projectShells = let
      dirs = builtins.attrNames (
        pkgs.lib.filterAttrs (
          name: type: 
            type == "directory" && builtins.pathExists (./. + "/${name}/default.nix")
        ) (builtins.readDir ./.)
      );
    in
      builtins.listToAttrs (
        map (
          name: {
            inherit name;
            value = import (./. + "/${name}") { inherit pkgs; };
          }
        ) dirs
      );

  in {
    
    # General use case development environments for different languages
    devShells."${system}" = {

      node = pkgs.mkShell {

        packages = with pkgs; [
          pnpm
          nodejs_24
        ];

        shellHook = ''
          echo 'Entered Node dev shell'
          echo "Packages:"
          echo "  pnpm:   `pnpm --version`"
          echo "  node:   `node --version`"

          # Modify prompt to give visual indicator of shell
          export PS1="\n\[\e[32m\][node-dev]\[\e[0m\] $PS1"
        '';
      };

      python = pkgs.mkShell {

        packages = with pkgs; [
          python314
          poetry

          # Runtime libraries that may be needed
          gcc             # provides libstdc++.so.6
          gfortran        # provides libgfortran
          openblas        # BLAS/LAPACK for numpy
          zlib            # occasionally needed by wheels
        ];

        shellHook = ''
          echo 'Entered Python dev shell'
          echo "Packages:"
          echo "  python: `python --version`"
          echo "  poetry: `poetry --version`"

          # Ensure that runtime libraries are in PATH
          export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [ 
            pkgs.gcc.cc.lib 
            pkgs.openblas 
            pkgs.zlib 
            pkgs.stdenv.cc.cc 
          ]}"

          # Modify prompt to give visual indicator of shell
          export PS1="\n\[\e[32m\][py-dev]\[\e[0m\] $PS1"
        '';
      };
    } // projectShells;
  };
}
