{...}: {
  imports = [
    ./base/default.nix
    ./boot/default.nix
    ./laptop/default.nix
    ./networking/default.nix
    ./dev/default.nix
    ./security/default.nix
    ./services/default.nix
    ./user/default.nix
  ];
}
