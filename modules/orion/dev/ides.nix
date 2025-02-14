{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # android-studio
    # jetbrains.pycharm-community
  ];
}
