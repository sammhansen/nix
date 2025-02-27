{pkgs, ...}: let
  neovim_config = ../../../../.config/nvim;
in {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      gnumake
      fd

      alejandra
      black
      golangci-lint
      gopls
      gotools
      hadolint
      isort
      lua-language-server
      markdownlint-cli
      nixd
      nodePackages.bash-language-server
      nodePackages.prettier
      nodePackages.typescript
      nodePackages.typescript-language-server
      pyright
      ruff
      shellcheck
      shfmt
      stylua
      terraform-ls
      tflint
      vscode-langservers-extracted
      yaml-language-server
    ];
  };

  # xdg.configFile = {
  # "nvim" = {
  # source = "${neovim_config}";
  # recursive = true;
  # };
  # };
}
