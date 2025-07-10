{pkgs, ...}:
{
	programs.hyprland.enable = true;
	environment.systemPackages = with pkgs; [
		hypridle
		hyprlock
		hyprpaper
		hyprshot
		kitty
		wofi
		xfce.thunar
		wofi
		playerctl
		brightnessctl
		pavucontrol
	];
}
