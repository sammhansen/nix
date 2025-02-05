{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      #videoDrivers = ["intel"];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    displayManager = {
      sessionPackages = [
        pkgs.hyprland
      ];
      sddm.enable = true;
      sddm.theme = "${import ./sddmtheme.nix {inherit pkgs;}}";
    };
  };

  environment.systemPackages = with pkgs;
  with libsForQt5; [
    qt5.qtquickcontrols2
    qt5.qtgraphicaleffects
  ];
}
