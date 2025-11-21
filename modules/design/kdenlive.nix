{ pkgs, ... }:
{
  environment.systemPackages =
    with pkgs;
    with libsForQt5;
    [
      (kdePackages.kdenlive.overrideAttrs (prevAttrs: {
        nativeBuildInputs = (prevAttrs.nativeBuildInputs or [ ]) ++ [ makeBinaryWrapper ];
        postInstall = (prevAttrs.postInstall or "") + ''
          wrapProgram $out/bin/kdenlive --prefix LADSPA_PATH : ${rnnoise-plugin}/lib/ladspa
        '';
      }))
    ];
}
