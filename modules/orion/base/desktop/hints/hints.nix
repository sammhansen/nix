{
  config,
  lib,
  pkgs,
  ...
}: {
  services.gnome.at-spi2-core.enable = true;

  programs.ydotool.enable = true;
  # users.users.myuser.extraGroups = ["ydotool"];

  home-manager.sharedModules = [
    ({config, ...}: {
      home.packages = with pkgs; [
        # From https://github.com/NixOS/nixpkgs/issues/376993#issuecomment-2615199894
        # add `gtk-layer-shell` to `buildInputs`
        (pkgs.callPackage ./hintspackage.nix {})
        grim
      ];

      # https://github.com/AlfredoSequeida/hints/tree/main?tab=readme-ov-file#system-requirements
      home.sessionVariables = {
        ACCESSIBILITY_ENABLED = "1";
        GTK_MODULES = "gail:atk-bridge";
        OOO_FORCE_DESKTOP = "gnome";
        GNOME_ACCESSIBILITY = "1";
        QT_ACCESSIBILITY = "1";
        QT_LINUX_ACCESSIBILITY_ALWAYS_ON = "1";
      };

      # https://github.com/AlfredoSequeida/hints/wiki/Window-Manager-and-Desktop-Environment-Setup-Guide#sway
      # wayland.windowManager.sway.config.input = {
      # "9011:26214:ydotoold_virtual_device" = {
      # accel_profile = "flat";
      # };
      # };

      # xdg.configFile."hints/config.json".text = builtins.toJSON {
      # overlay_x_offset = config.wayland.windowManager.sway.config.gaps.inner;
      # overlay_y_offset = config.wayland.windowManager.sway.config.gaps.inner;
      # };
    })
  ];
}
