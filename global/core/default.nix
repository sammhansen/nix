{...}: {
  imports = [
    ./boot/default.nix

    ./networking/default.nix
    ./locales.nix
    ./sound.nix
    ./extra.nix
    ./services.nix
    ./security.nix
    ./nix-ld.nix
  ];
}
