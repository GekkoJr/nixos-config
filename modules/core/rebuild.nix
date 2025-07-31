{ pkgs, lib, ... }:
{
  users.users.gekko.packages = lib.singleton (
    pkgs.writeShellApplication {
      name = "rb";
      runtimeInputs = [ pkgs.nixos-rebuild ];
      text = ''
        #! /usr/bin/env bash

        set -xeo pipefail

        find /home/gekko/nixos-config -iname "*.nix" -exec nixfmt {} \;


        sudo nixos-rebuild switch --flake /home/gekko/nixos-config
      '';
    }
  );
}
