{config, pkgs, ...}:
{
	imports = [
		../../home/hypr
		../../home/core-programs
	];

	home.username = "gekko";
	home.homeDirectory = "/home/gekko";

	home.stateVersion = "25.05";
	programs.home-manager.enable = true;
}
