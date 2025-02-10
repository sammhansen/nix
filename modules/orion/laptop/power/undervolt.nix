{pkgs, ...}: {
  # temperature target on battery
  services.undervolt = {
    enable = false;
    tempBat = 65; # deg C
    package = pkgs.undervolt;
  };
}
