{...}: {
  imports = [
    ./cli/default.nix
    ./gui/default.nix
    ./desktop/default.nix
    ./chaos/default.nix
    ./packages.nix
    ./virtualization/default.nix
  ];
}
