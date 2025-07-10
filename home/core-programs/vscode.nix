{pkgs, ...}:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;
		mutableExtensionsDir = false;
		profiles.default = {
			extensions = [

			];
		};
	};
}
