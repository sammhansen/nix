{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # twitch-hls-client
    steam-devices-udev-rules
  ];
}
