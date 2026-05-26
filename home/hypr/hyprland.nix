{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    settings = {
      mod = {
        _var = "SUPER";
      };

      monitor = [
        {
          output = "desc:Samsung Display Corp. 0x4187";
          mode = "1920x1200@60";
          position = "0x0";
          scale = "1";
          bitdepth = 10;
          vrr = 1;
          #cm = "hdr";
          #sdrbrightness = 1.3;
        }
        {
          output = "desc:AOC Q27G3XMN 1APQ7JA005063";
          mode = "2560x1440@180";
          position = "0x0";
          bitdepth = 10;
          #cm = "hdr";
          #sdrbrightness = 1.2;
          #sdrsaturation = 1.9;
        }
      ];

      bind = [
        {
          _args = [
            "SUPER + Q"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
          ];
        }
        {
          _args = [
            "SUPER + C"
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
          ];
        }
        {
          _args = [
            "SUPER + R"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wofi --show drun \")")

          ];
        }
      ];

      config = {
        general = {
          gaps_in = 5;
          gaps_out = 6;
          border_size = 2;

          layout = "dwindle";
        };

        decoration = {
          rounding = 10;

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };

        };

        animations = {
          enabled = true;
        };

        dwindle = {
          preserve_split = true;
        };

        input = {
          kb_layout = "no";
        };

        xwayland = {
          force_zero_scaling = true;
        };
      };

      device = {
        name = "glorious-model-d";
        sensitivity = -0.7;
      };

      window_rule = [
        {
          name = "Linux IR emitter fix";
          match.class = "linux-enable-ir-emitter";
          match.title = "linux-enable-ir-emitter";
          no_initial_focus = true;
        }
        {
          name = "Jetbrains fix-1";
          match.class = "^(jetbrains-.*)$";
          match.title = "^(splash)$";

          no_initial_focus = true;
          center = true;
          border_size = 0;
          float = true;
        }
        {
          name = "Jetbrains fix-2";
          match.class = "^(jetbrains-.*)$";
          match.title = "^()$";

          center = true;
          float = true;
          border_size = 0;
          stay_focused = true;
        }
        {
          name = "Jetbrains fix-3";
          match.class = "^(jetbrains-.*)$";
          match.title = "^(win.*)$";

          float = true;
          no_initial_focus = true;
        }
      ];
    };
  };
}
