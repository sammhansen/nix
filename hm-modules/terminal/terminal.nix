{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
    defaultCommand = "fd --type f --strip-cwd-prefix";
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always --line-range :42 {}'"
    ];
    changeDirWidgetOptions = ["--preview 'tree -C {} | head -200'"];
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
