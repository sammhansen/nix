{pkgs, ...}: {
  services = {
    xserver = {
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  programs = {
    niri = {
      enable = false;
    };

    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      withUWSM = true;
      xwayland.enable = true;
    };
    nm-applet.indicator = false;
  };

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
    ];
  };
  # xdg.portal = {
  # enable = true;
  # wlr.enable = true;
  # extraPortals = with pkgs; [
  # xdg-desktop-portal-gtk
  # xdg-desktop-portal
  # ];
  # configPackages = with pkgs; [
  # xdg-desktop-portal-hyprland
  # xdg-desktop-portal
  # ];
  # };

  environment.systemPackages = with pkgs; [
    # xwayland
    xwayland-satellite
    wlsunset
    vesktop
    hyprpaper
    wev
    xorg.xev
    swww
  ];
}
