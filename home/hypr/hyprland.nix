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
        {
          _args = [
            "SUPER + L"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprlock\")")
          ];
        }
        {
          _args = [
            "SUPER + F"
            (lib.generators.mkLuaInline "hl.dsp.window.fullscreen(\"fullscreen\", \"toggle\")")
          ];
        }
        {
          # hyprshutdown is a graceful shutdown utility for hyprland (better than old hl.dsp.exit())
          _args = [
            "SUPER + M"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshutdown\")")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + S"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region --clipboard-only \")")
          ];
        }
        {
          _args = [
            "SUPER + S"
            (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special(\"magic\")")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + S"
            (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"special:magic\"})")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + V"
            (lib.generators.mkLuaInline "hl.dsp.window.float({action = toggle})")
          ];
        }
        {
          _args = [
            "SUPER + mouse:272"
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
          ];
        }
        {
          _args = [
            "SUPER + mouse:273"
            (lib.generators.mkLuaInline "hl.dsp.window.resize()")
          ];
        }
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            {
              _args = [
                "SUPER + ${if ws != 10 then toString ws else toString 0}"
                (lib.generators.mkLuaInline "hl.dsp.focus({workspace = ${toString ws}})")
              ];
            }
            {
              _args = [
                "SUPER + SHIFT + ${if ws != 10 then toString ws else toString 0}"
                (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = ${toString ws}})")
              ];
            }
          ]
        ) 10
      ));

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
