{
  description = "Development shell for UTDesign Procurement EPICS project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = with pkgs; [
        pnpm
        nodejs_26
        prisma-engines_7
      ];

      shellHook = ''
        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][UTD-Procurement]\[\e[0m\] $PS1"
      '';
    };
  };
}
