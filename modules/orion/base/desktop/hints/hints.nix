{pkgs, ...}: {
  services.gnome.at-spi2-core.enable = true;

  programs.ydotool.enable = true;

  home-manager.sharedModules = [
    ({...}: {
      home.packages = with pkgs; [
        (pkgs.callPackage ./hintspackage.nix {})
        grim
      ];

      # home.sessionVariables = {
      # ACCESSIBILITY_ENABLED = "1";
      # GTK_MODULES = "gail:atk-bridge";
      # OOO_FORCE_DESKTOP = "gnome";
      # GNOME_ACCESSIBILITY = "1";
      # QT_ACCESSIBILITY = "1";
      # QT_LINUX_ACCESSIBILITY_ALWAYS_ON = "1";
      # };
    })
  ];
}
