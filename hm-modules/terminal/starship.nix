{lib, ...}: let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
  os = icon: fg: "[${icon} ](fg:${fg})";
  pad = {
    left = "";
    right = "";
  };
in {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
      format = lib.strings.concatStrings [
        "$nix_shell"
        "$os"
        "$cmd_duration"
        "$directory"
        "$container"
        "$git_branch $git_status"
        "$python"
        "$nodejs"
        "$lua"
        "$rust"
        "$java"
        "$c"
        "$golang"
        #"$cmd_duration"
        "$status"
        "$line_break"
        "$character"
        ''''${custom.space}''
      ];

      character = {
        success_symbol = "[ ](bold fg:purple)";
        error_symbol = "[ 󰅙](bold fg:red)";
      };

      custom.space = {
        when = ''! test $env'';
        format = "  ";
      };
      continuation_prompt = "∙  ┆ ";
      line_break = {disabled = false;};
      status = {
        symbol = "";
        not_found_symbol = "not found";
        not_executable_symbol = "permissions";
        sigint_symbol = "󰂭 ";
        signal_symbol = "󱑽 ";
        success_symbol = "";
        format = "[$symbol](fg:red)";
        map_symbol = true;
        disabled = false;
      };
      cmd_duration = {
        min_time = 1000;
        format = "[ $duration](fg:yellow)";
      };
      nix_shell = {
        disabled = false;
        format = "[${pad.left}](fg:white)[ ](bg:white fg:black)[${pad.right}](fg:white) ";
      };
      container = {
        symbol = " 󰏖";
        format = "[$symbol ](yellow dimmed)";
      };
      directory = {
        format = " [${pad.left}](fg:bright-black)[$path](bg:bright-black fg:white)[${pad.right}](fg:bright-black)";
        truncation_length = 6;
        truncation_symbol = "~/󰇘/";
      };
      # directory.substitutions = {
      #   "Documents" = "󰈙 ";
      #   "Downloads" = " ";
      #   "Music" = " ";
      #   "Pictures" = " ";
      #   "Videos" = " ";
      #   "Projects" = "󱌢 ";
      #   "School" = "󰑴 ";
      #   "GitHub" = "";
      #   ".config" = " ";
      #   "Vault" = "󱉽 ";
      # };
      git_branch = {
        symbol = "󰘬";
        style = "";
        format = "[[   on](fg:white) $symbol $branch](fg:purple)(:$remote_branch)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      /*
      git_state = {
      format = '[\($state( $progress_current of $progress_total)\)]($style) ';
      cherry_pick = "[🍒 PICKING](bold red)";
      };
      */
      git_status = {
        conflicted = " conflicted";
        ahead = " ahead";
        behind = " behind";
        diverged = " diverged";
        untracked = " untracked";
        stashed = " stashed";
        modified = " modified";
        renamed = " renamed";
        deleted = " deleted";
        staged = "`++($count)(green)`";
        format = "($conflicted)($ahead)($behind)($diverged)($untracked)($stashed)($modified)($renamed)($deleted)";
      };

      os = {
        disabled = false;
        format = "$symbol";
      };
      os.symbols = {
        Arch = os "" "bright-blue";
        Debian = os "" "red)";
        EndeavourOS = os "" "purple";
        Fedora = os "" "blue";
        NixOS = os "" "blue";
        openSUSE = os "" "green";
        SUSE = os "" "green";
        Ubuntu = os "" "bright-purple";
      };
      python = lang " " "yellow";
      nodejs = lang "  " "yellow";
      lua = lang " 󰢱" "blue";
      rust = lang " " "red";
      java = lang " " "red";
      c = lang " " "blue";
      golang = lang " " "blue";
    };
  };
}
