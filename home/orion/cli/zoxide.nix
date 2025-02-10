{...}: {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = false;
    enableNushellIntegration = true;

    options = ["--cmd cd"];
  };
}
