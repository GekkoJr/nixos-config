{ config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = [
        #"desc:Samsung Display Corp. 0x4187, 1920x1200@60, 0x0, 1, vrr,1, bitdepth, 10 render:cm_auto_hdr=1 cm_fs_passthrough = 0"
      ];

      monitorv2 = {
        output = "desc:Samsung Display Corp. 0x4187";
        mode = "1920x12000@60";
        position = "0x0";
        scale = "1";
        bitdepth = 10;
        vrr = "1";
        #cm = "hdr";
        #sdrbrightness = 1.3;
      };

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, E, exec, thunar"
        "$mod, R, exec, wofi --show drun"

        "$mod, C, killactive,"
        "$mod, F, fullscreen"
        "$mod, L, exec, hyprlock"
        "$mod CTRL, V, togglefloating"
        "$mod, M, exit,"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
        "$mod CTRL, S, exec, hyprshot -m region --clipboard-only"
        "$mod, H, exec, hyprpanel t bar-0"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%- -l 1.0"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+ -l 1.0"

        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ]
      ++ (
        # adding workspace 1-9
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, ${if ws != 10 then toString ws else toString 0}, workspace, ${toString ws}"
              "$mod SHIFT, ${if ws != 10 then toString ws else toString 0}, movetoworkspace, ${toString ws}"
            ]
          ) 10
        )
      );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        kb_layout = "no";
      };

      general = {
        gaps_in = "5";
        gaps_out = "6";
        border_size = "2";
        #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        #"col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      device = {
        name = "glorious-model-d";
        sensitivity = -0.7;
      };

      decoration = {
        rounding = "10";

        blur = {
          enabled = true;
          size = "3";
          passes = "1";
        };

      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      windowrulev2 = [
        # Fix linux enable ir emitter stealing focus
        "nofocus,class:linux-enable-ir-emitter,title:linux-enable-ir-emitter,floating:1"

        # https://github.com/hyprwm/Hyprland/issues/3450#issuecomment-1816761575
        # -- Fix odd behaviors in IntelliJ IDEs --
        # Fix splash screen showing in weird places and prevent annoying focus takeovers
        "center,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        "nofocus,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        "noborder,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"

        # Center popups/find windows
        "center,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        "stayfocused,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        "noborder,class:^(jetbrains-.*)$,title:^( )$,floating:1"
        #! Disable window flicker when autocomplete or tooltips appear
        "nofocus,class:^(jetbrains-.*)$,title:^(win.*)$,floating:1"
      ];

      xwayland.force_zero_scaling = true;
    };
  };
}
