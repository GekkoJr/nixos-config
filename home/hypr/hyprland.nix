{...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$mod" = "SUPER";
			exec-once = [
				"hyprpaper"
			];

			bind = [
				"$mod, Q, exec, alacritty"
				"$mod, E, exec, thunar"
				
				"$mod, C, killactive,"
				"$mod, F, fullscreen"
				"$mod, L, exec, hyprlock"
				"$mod CTRL, V, togglefloating"
				"$mod, M, exit,"

				"$mod, S, togglespecialworkspace, magic"
				"$mod SHIFT, S, movetoworkspace, special:magic"
			]
			++ (
			# adding workspace 1-9
			builtins.concatLists (
			builtins.genList (
				i:
					let ws = i + 1;
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
		};
	};
}
