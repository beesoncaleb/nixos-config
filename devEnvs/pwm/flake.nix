{
  description = "Development shell for Play With Me EPICS project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    prisma-pkgs = import unstable { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = [
        pkgs.pnpm
        pkgs.nodejs_24
        prisma-pkgs.prisma-engines_7;
      ];

      shellHook = ''
        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][PWM]\[\e[0m\] $PS1"
      '';
    };
  };
}
