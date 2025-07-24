{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    php
    laravel
  ];
}
