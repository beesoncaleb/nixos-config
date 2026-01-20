# This shell is pretty redundant but honestly I just wanted to try some new shell stuff that will be more useful for other projects
{ pkgs, unstable, ... }: pkgs.mkShell {
    
  
  packages = [
    pkgs.pnpm
    pkgs.nodejs_24
  ];

  shellHook = ''

    echo 'Entered UTD Procurement dev shell'
    echo "Packages:"
    echo "  pnpm:   `pnpm --version`"
    echo "  node:   `node --version`"

    # Modify prompt to give visual indicator of shell
    export PS1="\n\[\e[32m\][procurement]\[\e[0m\] $PS1"
  '';
}
