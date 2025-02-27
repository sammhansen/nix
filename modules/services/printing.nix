{pkgs, ...}: {
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        hplipWithPlugin
      ];
    };

    # required for network discovery of printers
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
