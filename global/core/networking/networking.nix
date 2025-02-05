{
  config,
  pkgs,
  host,
  options,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      #dns = "dnsmasq";
    };

    hostName = "${host}";
    hosts = {
      # "127.0.0.2" = ["other-localhost"];
      # "192.0.2.1" = ["mail.example.com" "imap.example.com"];
      "10.10.125.64" = ["cyprusbank.thm" "admin.cyprusbank.thm"];
    };

    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    nameservers = ["8.8.8.8" "8.8.4.4"];

    nftables = {
      enable = true;
      ruleset = ''
        table ip nat {
            chain PREROUTING {
                type nat hook prerouting priority dstnat; policy accept;
                iifname "ens3" tcp dport 80 dnat to 10.100.0.3:80
            }
        }
      '';
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };

    nat = {
      enable = true;

      internalInterfaces = ["waydroid0" "docker0"];
      externalInterface = "wlp4s0";

      internalIPs = ["192.168.240.0/24"];
      # externalIP = "Your IP";

      /*
         forwardPorts = [
        {
            sourcePort = 80;
            proto = "tcp";
            destination = "10.100.0.3:80";
        }
      ];
      */
    };
  };

  # services.dnsmasq.enable = true;

  /*
     services.create_ap = {
      enable = true;
      settings = {
          INTERNET_IFACE = "eth0";
          WIFI_IFACE = "wlan0";
          SSID = "biiitch";
          PASSPHRASE = "calculAss";
       };
  };
  */

  environment.systemPackages = with pkgs; [
    openvpn
    # dnsmasq
    # hostapd
    # linux-wifi-hotspot
  ];
}
