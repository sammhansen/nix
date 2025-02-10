{
  pkgs,
  username,
  ...
}: let
  inherit (import ./variables.nix) gitUsername;
in {
  users = {
    users."lilith" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
        "docker"
        "wireshark"
        "dialout"
        "fingerprint"
        "plugdev"
      ];
    };

    # create groups that arent created
    groups = {
      scanner = {};
      libvirtd = {};
      wireshark = {};
      dialout = {};
      fingerprint = {};
      plugdev = {};
    };

    defaultUserShell = pkgs.fish;
  };

  environment.shells = with pkgs; [
    fish
    nushell
  ];

  programs.fish.enable = true;
}
