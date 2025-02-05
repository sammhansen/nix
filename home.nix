{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hm-modules/default.nix
  ];

  home.username = "asherah";
  home.homeDirectory = "/home/asherah";

  home.file = {
  };

  home.packages = with pkgs; [
    uwsm
    networkmanagerapplet
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXOS_OZONE_WL = "1"; # for electron apps to use wayland
    TERMINAL = "wezterm";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
