{...}: {
  imports = [
    ./networking.nix
    ./hosts.nix
    # ./hotspot.nix

    ./masking/default.nix
    ./rules/default.nix
  ];
}
