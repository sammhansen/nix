{...}: {
  programs.eza = {
    enable = true;
    icons = "auto";

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = false;
    # enableNushellIntegration = config.programs.nushell.enable;

    extraOptions = [
      "--group"
      "--group-directories-first"
      "--header"
      "--no-permissions"
      "--octal-permissions"
    ];
  };
}
