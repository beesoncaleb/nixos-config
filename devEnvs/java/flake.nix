{
  description = "General purpose development shell for Java";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
        packages = with pkgs; [
          jdk21
        ];

        shellHook = ''
          # Modify prompt to give visual indicator of shell
          export PS1="\n\[\e[32m\][Java]\[\e[0m\] $PS1"
        '';
    };
  };
}
