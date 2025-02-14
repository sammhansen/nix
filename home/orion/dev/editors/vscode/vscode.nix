{
  lib,
  config,
  pkgs,
  ...
}: let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  keybinds = mkLink "./keybindings.json";
  settings = mkLink "./settings.json";
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      # THEMEING
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      # GIT
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github
      github.vscode-github-actions
      eamodio.gitlens

      # UTILITIES
      ms-vscode-remote.remote-ssh
      ms-vscode.live-server
      vscodevim.vim # yes i hate myself
      wakatime.vscode-wakatime

      # LANGUAGES BASED EXTENSIONS
      ## NIX
      jnoortheen.nix-ide
      kamadorueda.alejandra
      mkhl.direnv

      ## RUST
      rust-lang.rust-analyzer

      ## GO
      golang.go

      ## LUA
      sumneko.lua

      ## TOML
      tamasfe.even-better-toml

      ## WEB DEV
      ### GENERAL
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
      denoland.vscode-deno

      ### PHP
      # devsense.phptools-vscode

      ### MARKDOWN
      shd101wyy.markdown-preview-enhanced
      unifiedjs.vscode-mdx
      valentjn.vscode-ltex
    ];
  };

  xdg.configFile = {
    "VSCode/User/keybindings.json".source = keybinds;
    "VSCode/User/settings.json".source = settings;
  };
}
