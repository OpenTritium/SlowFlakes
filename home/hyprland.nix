{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      monitor = [
        ", highres, auto, 2" # scaling factor is `2`
      ];
      env = [
        "QT_QPA_PLATFORM,wayland"
        "DISABLE_QT5_COMPACT,0"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

        "GDK_BACKEND,wayland"
        "GDK_SCALE,1"

        "WLR_BACKEND,vulkan"
        "WLR_RENDERER,vulkan"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"

        "SDL_VIDEODRIVER,waland"

        "CLUTTER_BACKEND,wayland"

        "ELECTRON_OZONE_PLATFORM_HINT,auto"

        "NIXOS_OZONE_WL,1"

        "XCURSOR_SIZE,32"
      ];
      exec-once = [
        #"swww img /home/tritium/bgs" # todo
        "systemctl --user start hyprpolkitagent.services"
      ];

      general = {
        resize_on_border = true;
        gaps_in = 3;
        gaps_out = 10;
        allow_tearing = true;
      };
      xwayland.force_zero_scaling = true;
      decoration = {
        rounding = 5;
        rounding_power = 4;
        dim_inactive = true;
        dim_strength = 0.2;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
        };
        shadow = {
          range = 5;
          render_power = 4;
        };
      };
      input = {
        kb_layout = "us";
        kb_model = "pc84";
        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      "$mod" = "CTRL";
      bind =
        [
          "$mod and SHIFT, R, exec, kitty"
          ", Print, exec, grimblast copy area"
          "$mod and SHIFT, F, fullscreen"
          "$mod, Q, killactive"
          "$mod, R, exec, wofi --normal-window --term kitty --show run"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));
    };
  };
}
