{config, pkgs, ...}:
{
	imports = [
		../../home/hypr
	];

	home.username = "gekko";
	home.homeDirectory = "/home/gekko";

	home.packages = with pkgs; [
		nixfmt-rfc-style
	];

	home.stateVersion = "25.05";
	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName = "GekkoJr";
		userEmail = "gekkojr@proton.me";
	};
}
