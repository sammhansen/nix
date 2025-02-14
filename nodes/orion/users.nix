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
      shell = pkgs.bash;
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
        "ydotool" #require for hints
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

    defaultUserShell = pkgs.bash;
  };

  environment.shells = with pkgs; [
    bash
    fish
    nushell
  ];

  programs.fish.enable = true;
}
