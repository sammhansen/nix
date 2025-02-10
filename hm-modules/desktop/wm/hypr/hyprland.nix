{
  lib,
  inputs,
  username,
  pkgs,
  ...
}: let
  screenshot_path = "/home/${username}/Pictures/Screenshots";
  hyprshot = pkgs.writeShellScriptBin "hyprshot.sh" ''
    if [[ ! -d ${screenshot_path} ]];then
      mkdir -p ${screenshot_path}
    fi

    ${pkgs.hyprshot}/bin/hyprshot -m region -o ${screenshot_path}
  '';

  clipboard = pkgs.writeShellScriptBin "rofi-clipboard.sh" ''
    config="
    configuration{dmenu{display-name:\" \";}}
    window{width:440px; height:271px;}
    listview{scrollbar:false;}
    "
    themeDir="~/.config/rofi/themes/default.rasi"

    cliphist list |
        rofi -dmenu -theme-str "''${config}" -theme "''${themeDir}" |
        cliphist decode |
        wl-copy
  '';
in {
  services.hyprpaper = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = {
      env = [
        "DESKTOP_SESSION,hyprland"
        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"

        "QT_QPA_PLATFORM, wayland"
        "QT_QPA_PLATFORM=xcb genymotion"
        "QT_QPA_PLATFORMTHEME, fcitx"
        #"QT_STYLE_OVERRIDE,kvantum"
        "WLR_NO_HARDWARE_CURSORS, 1"

        # Mozilla
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "MOZ_ENABLE_WAYLAND,1"

        # MOUSE CURSOR
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
      ];

      monitor = [",preferred,auto,1"];
      "exec-once" = [
        "uwsm app -- ags run &"
        "uwsm app -- nm-applet &"
        "uwsm app -- wl-paste --type text --watch cliphist store &"
        "uwsm app -- wl-paste --type image --watch cliphist store &"
        "uwsm app -- discord &"
        "uwsm app -- hyprshade on blue-light-filter"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 5;
        gaps_workspaces = 50;
        border_size = 1;
        layout = "dwindle";
        resize_on_border = true;
        "col.active_border" = lib.mkForce "rgba(4f4256CC)";
        "col.inactive_border" = lib.mkForce "rgba(4f4256CC)";
      };
      dwindle = {
        preserve_split = true;
        smart_resizing = false;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 700;
        workspace_swipe_fingers = 4;
        workspace_swipe_cancel_ratio = 0.2;
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 10;
        workspace_swipe_create_new = true;
      };
      binds = {scroll_event_delay = 0;};
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        repeat_delay = 250;
        repeat_rate = 35;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.5;
        };

        follow_mouse = 1;
      };
      decoration = {
        rounding = 20;

        blur = {
          enabled = false;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 5;
          passes = 4;
          brightness = 1;
          noise = 1.0e-2;
          contrast = 1;
        };

        # Dim
        dim_inactive = false;
        dim_strength = 0.1;
        dim_special = 0;
      };
      animations = {
        enabled = true;
        bezier = [
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          # "workspaces, 1, 3.5, md3_decel, slide"
          "workspaces, 1, 7, fluent_decel, slide"
          # "workspaces, 1, 7, fluent_decel, slidefade 15%"
          # "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
      misc = {
        vfr = 1;
        vrr = 1;
        # layers_hog_mouse_focus = true;
        focus_on_activate = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        enable_swallow = false;
        swallow_regex = "(foot|kitty|allacritty|Alacritty|wezterm)";

        disable_hyprland_logo = true;
        new_window_takes_over_fullscreen = 2;
      };
      debug = {
        disable_logs = false;
        # overlay = true;
        # damage_tracking = 0;
        # damage_blink = true;
      };

      bind = [
        # Recording stuff
        "Super+Alt, R, exec, ~/.config/ags/scripts/record-script.sh" # Record region (no sound)
        "Ctrl+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen" # [hidden] Record screen (no sound)
        "Super+Shift+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen-sound" # Record screen (with sound)
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      binde = [
        "SUPER+ALT, Space, togglefloating,"
        # "SUPER, F, fullscreen,"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, C, exec, hyprctl dispatch centerwindow"
        "SUPER, T, exec, hyprctl dispatch togglesplit"
        "SUPER, P, pin, active"
        "ALT, L, exec, hyprlock"

        # Focus Window
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        # Move Window
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"

        # Special Window/Scrachpad
        # "SUPER, S, togglespecialworkspace"
        # "SUPER SHIFT, S, movetoworkspace, special"

        # Group
        "SUPER, G, togglegroup,"
        "SUPER SHIFT, G, lockgroups, toggle"
        "ALT SHIFT, H, changegroupactive, b"
        "ALT SHIFT, L, changegroupactive, f"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"

        # Move active window to a workspace with mainMod + SHIFT + [0-5]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Audio Control
        "SUPER SHIFT, P, exec, playerctl play-pause"

        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        ",XF86Search, exec, blueberry"

        # Apps
        "SUPER, TAB, exec, uwsm app -- ghostty"
        "SUPER , E, exec, uwsm app -- nautilus --new-window"
        "SUPER, D, exec, ~/.config/hypr/dmenu.sh"
        "SUPER, PERIOD, exec, uwsm app -- ${pkgs.smile}/bin/smile"
        "ALT, S, exec, ${hyprshot}/bin/hyprshot.sh"

        # Ags Windows
        "Alt, P, exec, ags -t notification-center"
        "SUPER, W, exec, ags -t wallpapers"
        "ALT, M, exec, ags -t mpris-player-window"
        "SUPER+Ctrl, R, exec, pkill gjs ydotool && ags run &"

        # Rofi
        "SUPER, A , exec,  rofi -show drun -show-icons -run-command 'uwsm app -- {cmd}' -theme ~/.config/rofi/themes/default.rasi"
        "SUPER, V, exec, ${clipboard}/bin/rofi-clipboard.sh"
        "SUPER, W , exec, ${pkgs.rofi-power-menu}/bin/rofi-powermenu"

        "Super, B, exec, zen"
        "Alt, C, exec, google-chrome-stable --app='https://chatgpt.com'"
        "Alt, G, exec, google-chrome-stable --app='https://gemini.google.com/app'"

        # Screen Recorder
        # "Super+Alt, R, exec, ~/.config/ags/scripts/record-script.sh"
        # "Control+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen"
        # "Super+Shift+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen-sound"

        "Super, F, fullscreen, 0"
        "Super, D, fullscreen, 1"
        #"Super_Alt, F, fakefullscreen, 0"
        "Super, 1, workspace, 1"
        "Super, 2, workspace, 2"
        "Super, 3, workspace, 3"
        "Super, 4, workspace, 4"
        "Super, 5, workspace, 5"
        "Super, 6, workspace, 6"
        "Super, 7, workspace, 7"
        "Super, 8, workspace, 8"
        "Super, 9, workspace, 9"
        "Super, 0, workspace, 10"
        "Super, S, togglespecialworkspace,"
        # "Control+Super, S, togglespecialworkspace,"
        "Alt, Tab, cyclenext"
        "Alt, Tab, bringactivetotop,"
        "Super+Alt, 1, movetoworkspacesilent, 1"
        "Super+Alt, 2, movetoworkspacesilent, 2"
        "Super+Alt, 3, movetoworkspacesilent, 3"
        "Super+Alt, 4, movetoworkspacesilent, 4"
        "Super+Alt, 5, movetoworkspacesilent, 5"
        "Super+Alt, 6, movetoworkspacesilent, 6"
        "Super+Alt, 7, movetoworkspacesilent, 7"
        "Super+Alt, 8, movetoworkspacesilent, 8"
        "Super+Alt, 9, movetoworkspacesilent, 9"
        "Super+Alt, 0, movetoworkspacesilent, 10"
        "Control+Shift+Super, Up, movetoworkspacesilent, special"
        "Super+Alt, S, movetoworkspacesilent, special"
      ];

      windowrule = [
        "noblur,.*" # Disables blur for windows. Substantially improves performance.
        # "opacity 0.89 override 0.93 override, .*" # Applies transparency to EVERY WINDOW
        "float, ^(steam)$"
        "float, polkit-gnome-authentication-agent-1"
        "size 300 300, polkit-gnome-authentication-agent-1"
        "float, Genymotion Player"
        "float, Volume Control"
        "float, title:^(Smile)$"
        "float, ^(blueberry.py)$"
        "pin, ^(showmethekey-gtk)$"
        "float,title:^(Open File)(.*)$"
        "float,title:^(Select a File)(.*)$"
        "float,title:^(Choose wallpaper)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$ "
      ];

      layerrule = [
        "xray 1, .*"
        "noanim, selection"
        "noanim, overview"
        "noanim, anyrun"
        "blur, swaylock"
        "noanim, noanim"
        "blur, noanim"
        "blur, gtk-layer-shell"
        "ignorezero, gtk-layer-shell"
        "blur, launcher"
        "ignorealpha 0.5, launcher"
        "blur, notifications"
        "ignorealpha 0.69, notifications"
        "blur, session"
        "noanim, sideright"
        "noanim, sideleft"
      ];
    };
  };
}
