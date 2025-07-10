{pkgs, ...}:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;
		mutableExtensionsDir = false;
		profiles.default = {
			extensions = [
				pkgs.vscode-extensions.bbenoist.nix
				pkgs.vscode-extensions.ms-python.python
			];
		};
	};
}
