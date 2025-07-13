{pkgs, ...}:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;
		mutableExtensionsDir = false;
		profiles.default = {
			extensions = [
				pkgs.vscode-extensions.bbenoist.nix # nix support
				pkgs.vscode-extensions.ms-python.python # python support
				pkgs.vscode-extensions.leonardssh.vscord # Discord rich prescence
			];
		};
	};
}
