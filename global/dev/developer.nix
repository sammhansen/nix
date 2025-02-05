{
  config,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    clang
    cmake
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

    nodejs
    yarn
    csslint

    #waydroid
  ];
}
