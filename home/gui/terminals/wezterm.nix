{
  pkgs,
  inputs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;

    extraConfig = ''
      return {
        enable_wayland = true,
        color_scheme = "Catppuccin Mocha",
	font = wezterm.font("SpaceMono Nerd Font"),
        font_size = 12.0,
        cell_width = 0.9,
        default_cursor_style = "BlinkingBar",

        window_close_confirmation = "NeverPrompt",
        hide_tab_bar_if_only_one_tab = true,
        scroll_to_bottom_on_input = true,

        window_padding = {
          top = "0cell",
          right = "1cell",
          bottom = "0.4cell",
          left = "1cell",
        },

        inactive_pane_hsb = {
          saturation = 0.9,
          brightness = 0.8,
        },

        window_background_opacity = 0.9,
        text_background_opacity = 1.0,

        audible_bell = "Disabled",
        max_fps = 120,

        default_prog = { "${pkgs.tmux}/bin/tmux" },
      }
    '';
  };
}
