{config, ...}: {
  programs.yazi = {
    enableFishIntegration = true;
    enable = true;
    settings = {
      enableBashIntegration = true;
      log.enabled = false;
      preview.max_width = 1000;
      manager = {
        sort_dir_first = true;
        linemode = "size";
        show_symlink = true;
        show_hidden = false;
      };
      plugin.prepend_previewers = [
        {
          mime = "audio/*";
          run = "exifaudio";
        }
      ];
    };
    keymap.manager.prepend_keymap = [
      {
        on = ["<A-p>"];
        run = "cd ${config.home.homeDirectory}/Pictures";
      }
      {
        on = ["<A-w>"];
        run = "plugin set-wall";
        desc = "My own wallpaper plugin, which utilizes swww & hyprpaper";
      }
      {
        on = ["c" "a"];
        run = "plugin compress";
      }
      {
        on = ["c" "m"];
        run = "plugin chmod";
      }
      {
        on = "F";
        run = "plugin smart-filter";
      }
    ];
    theme = with config.lib.stylix.colors; {
      status = {
        separator_style = {
          fg = "#${base01}";
          bg = "#${base01}";
        };
        mode_normal = {
          fg = "#${base00}";
          bg = "#${base0D}";
          bold = true;
        };
        mode_select = {
          fg = "#${base00}";
          bg = "#${base0C}";
          bold = true;
        };
        mode_unset = {
          fg = "#${base00}";
          bg = "#${base0F}";
          bold = true;
        };
      };
    };
  };
}
