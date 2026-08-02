{ ... }:
{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig = {
        pipewire = {
          "10-clock-rate" = {
            "context.properties" = {
              "default.clock.allowed_rates" = [
                44100
                24000
                48000
                256000
                96000
                192000
              ];
              "default.clock.rate" = 256000;
            };
          };

        };
      };
    };
  };
}
