{
  pkgs,
  username,
  ...
}: let
  homeDir = "/home/${username}";
in {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.bookmarks = [
      "file://${homeDir}/Documents"
      "file://${homeDir}/Downloads"
      "file://${homeDir}/GitHub"
      "file://${homeDir}/Music"
      "file://${homeDir}/Pictures"
      "file://${homeDir}/Pictures/Screenshots"
      "file://${homeDir}/Videos"
    ];
  };
}
