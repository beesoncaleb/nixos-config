{
  description = "General purpose development shell for Python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
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
          # Ensure that runtime libraries are in PATH
          export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [ 
            pkgs.gcc.cc.lib 
            pkgs.openblas 
            pkgs.zlib 
            pkgs.stdenv.cc.cc 
          ]}"

          # Modify prompt to give visual indicator of shell
          export PS1="\n\[\e[32m\][Python]\[\e[0m\] $PS1"
        '';
    };
  };
}
