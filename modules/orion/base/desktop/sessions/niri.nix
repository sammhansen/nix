{pkgs, ...}: {
  programs.niri = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
