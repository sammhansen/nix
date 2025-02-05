{...}: {
  imports = [
    ./developer.nix
    ./vscode.nix
    ./neovim.nix

    ./postgresql.nix
    ./python.nix
    ./mysql.nix
  ];
}
