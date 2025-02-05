{pkgs, ...}: {
  imports = [
    ./python/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # (callPackage ./burpsuitepro.nix)
  ];
}
