{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim-unwrapped
    alejandra
    black
    gnumake
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

    delve
  ];
}
