{config, ...}: {
  nix = {
    # we can disable channels since we can just use the flake
    channel.enable = false;

    # we need to have nixpkgs in our path
    nixPath = ["nixpkgs=${config.nix.registry.nixpkgs.to.path}"];

    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      # more logging is nice when doing installs, we want to know if something goes wrong
      log-lines = 50;

      # A unimportant warning in this case
      warn-dirty = false;

      # Its nice to have more http downloads when setting up
      http-connections = 50;

      auto-optimise-store = true;

      # fetch from a cache if we can
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cosmic.cachix.org"
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };
  };
}
