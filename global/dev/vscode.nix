{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # vscode-with-extensions
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions;
        [
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
          ms-azuretools.vscode-docker
          esbenp.prettier-vscode
          ms-vscode.live-server
          ritwickdey.liveserver
          formulahendry.code-runner
          vscodevim.vim # yes i hate myself
          wakatime.vscode-wakatime

          # LANGUAGES BASED EXTENSIONS
          ## NIX
          jnoortheen.nix-ide
          bbenoist.nix
          kamadorueda.alejandra
          mkhl.direnv

          ## C C++
          ms-vscode.cpptools

          ## PYTHON
          ms-python.python

          ## RUST
          serayuzgur.crates
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
          devsense.phptools-vscode

          ### MARKDOWN
          shd101wyy.markdown-preview-enhanced
          unifiedjs.vscode-mdx
          valentjn.vscode-ltex
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "solarized-osaka";
            publisher = "sherloach";
            version = "0.1.1";
            hash = "sha256-HYkzht8jPYBwE3bHHvyU4amNYunsfayPTWBiBVyY+1g=";
          }
        ];
    })
  ];
}
