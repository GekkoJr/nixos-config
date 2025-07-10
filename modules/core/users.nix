{pkgs, ...}: 
{
	users.defaultUserShell = pkgs.zsh;
	users.users.gekko = {
		isNormalUser = true;
		useDefaultShell = true;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};
}
