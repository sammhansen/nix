{
  pkgs,
  inputs,
  ...
}: {
  imports = [./wezterm.nix];

  terminals.wezterm = let
    charmful-dark = let
      bg = "#171717";
      fg = "#b2b5b3";
      bright_bg = "#373839";
      bright_fg = "#e7e7e7";
      black = "#313234";
    in {
      background = bg;
      foreground = fg;
      cursor_bg = fg;
      cursor_fg = black;
      cursor_border = fg;
      selection_fg = black;
      selection_bg = fg;
      scrollbar_thumb = fg;
      split = black;
      ansi = [
        bright_bg
        "#e55f86"
        "#00D787"
        "#EBFF71"
        "#51a4e7"
        "#9077e7"
        "#51e6e6"
        bright_fg
      ];
      brights = [
        black
        "#d15577"
        "#43c383"
        "#d8e77b"
        "#4886c8"
        "#8861dd"
        "#43c3c3"
        fg
      ];
    };
  in {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    alias = ["xterm"];

    font = "SpaceMono Nerd Font";

    themes = {
      Dark = "Charmful Dark";
    };

    settings = {
      enable_wayland = true;
      color_schemes = {
        "Charmful Dark" = charmful-dark;
      };
      color_scheme = "Charmful Dark";
      cell_width = 0.9;
      default_cursor_style = "BlinkingBar";

      window_close_confirmation = "NeverPrompt";
      hide_tab_bar_if_only_one_tab = true;
      scroll_to_bottom_on_input = true;

      window_padding = {
        top = "0cell";
        right = "1cell";
        bottom = "0.4cell";
        left = "1cell";
      };

      inactive_pane_hsb = {
        saturation = 0.9;
        brightness = 0.8;
      };

      window_background_opacity = 0.7;
      text_background_opacity = 1.0;

      audible_bell = "Disabled";

      max_fps = 120;

      default_prog = ["${pkgs.tmux}/bin/tmux"];
    };

    extraLua = ''
       local wa = wezterm.action

       wezterm.on("padding-off", function(window)
       	local overrides = window:get_config_overrides() or {}
       	if not overrides.window_padding then
       		overrides.window_padding = {
       			top = "0",
       			right = "0",
       			bottom = "0",
       			left = "0",
       		}
       	else
       		overrides.window_padding = nil
       	end
       	window:set_config_overrides(overrides)
       end)

       wezterm.on("toggle-opacity", function(window)
       	local overrides = window:get_config_overrides() or {}
       	if not overrides.window_background_opacity then
       		overrides.window_background_opacity = 0.7
       	else
       		overrides.window_background_opacity = nil
       	end
       	window:set_config_overrides(overrides)
       end)

      config.keys = {
       	{ key = "p", mods = "CTRL", action = wa.EmitEvent("padding-off") },
        { key = "o", mods = "CTRL", action = wa.EmitEvent("toggle-opacity") },

        {key="Tab", mods="CTRL", action=wezterm.action.SendKey {key="`", mods="CTRL"}},

      }
    '';
  };
}
