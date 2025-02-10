{pkgs, ...}: {
  home.packages = with pkgs;
  with nodePackages; [
    ts-node
    nodejs
  ];
}
