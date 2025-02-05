{pkgs, ...}: let
  aliases = import ./aliases.nix;
in {
  programs.fish = {
    enable = true;
    shellAliases = aliases;

    interactiveShellInit = ''
      set fish_greeting
      set -g -x PATH "$HOME/go/bin:$PATH"

      set fish_cursor_default     block      blink
      set fish_cursor_insert      line       blink
      set fish_cursor_replace_one underscore blink
      set fish_cursor_visual      block
    '';
    functions = {
      fish_user_key_bindings = ''
        fish_vi_key_bindings
      '';

      copydir =
        #fish
        ''
          if test "$XDG_SESSION_TYPE" = "wayland"
              pwd | tr -d '\r' | wl-copy
          else
              pwd | tr -d  '\r' | xclip -sel clip
          end
        '';
    };
    plugins = [
      # Auto-complete matching pairs
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
          sha256 = "0l2g922gwjd64ar41j7cp09vvvrs30ha55b85nidni4i4bbfvpda";
        };
      }

      # Automatically receive notifications when long processes finish
      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "eb32ade85c0f2c68cbfcff3036756bbf27a4f366";
          sha256 = "12l7m08bp8vfhl8dmi0bfpvx86i344zbg03v2bc7wfhm20li3hhc";
        };
      }

      # TEXT EXPANSIONS FOR FISH
      {
        name = "puffer-fish";
        src = pkgs.fetchFromGitHub {
          owner = "nickeb96";
          repo = "puffer-fish";
          rev = "12d062eae0ad24f4ec20593be845ac30cd4b5923";
          sha256 = "06g8pv68b0vyhhqzj469i9rcics67cq1kbhb8946azjb8f7rhy6s";
        };
      }

      # FZF FISH PLUGIN
      {
        name = "fzf-fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          sha256 = "1hqqppna8iwjnm8135qdjbd093583qd2kbq8pj507zpb1wn9ihjg";
        };
      }
    ];
  };
}
