{
  description = "Development shell for Managing Infrastructure at NPTS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = with pkgs; [
        opentofu
        awscli2
      ];

      shellHook = ''
        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][NPTS Infra]\[\e[0m\] $PS1"
      '';
    };
  };
}
