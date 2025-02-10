{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [

    torctl
    tor
    iptables

  ];


  
  /*services.tor = {
    enable = true;
    client.enable = true;
    openFirewall = true;
    client.dns.enable = true;
    torsocks.enable = true;
    relay = {
      enable = false;
      role = "relay";
    };
    settings = {
      ContactInfo = "lucifer@proton.me";
      Nickname = "femboy02";
      ORPort = 9001;
      ControlPort = 9051;
      BandWidthRate = "1 MBytes";
    };
  };*/

}
