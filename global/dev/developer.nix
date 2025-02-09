{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    clang
    cmake
    gnumake
    go
    gcc

    lazygit

    openjdk23
    uv
    poetry
    python311Full
    zlib
    ruby

    android-tools
    android-studio
    android-studio-tools
    gradle

    jetbrains.pycharm-community
    spyder

    nodejs
    yarn
    csslint
  ];
}
