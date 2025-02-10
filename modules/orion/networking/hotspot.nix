{ pkgs, ... }:
{
  services.create_ap = {
    enable = false;
    settings = {
      INTERNET_IFACE = "enp0s31f6";
      WIFI_IFACE = "wlp4s0";
      SSID = "biiitch";
      PASSPHRASE = "calculAss";
    };
  };
  
  environment.systemPackages = with pkgs; [
    hostapd
  ];
}
