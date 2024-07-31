{ config, pkgs, ... }:
    {
        environment.systemPackages = with pkgs; [
            mangohud
            goverlay
            lutris
        ];
        programs.steam.enable = true;
        hardware.amdgpu.initrd.enable = true;
        programs.gamemode = {
            enable = true;
            settings.general.inhibit_screensaver = 0;
        };
    }