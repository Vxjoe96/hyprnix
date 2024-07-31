{ config, pkgs, ... }:
    {
        environment.systemPackages = with pkgs; [
            mangohud
            goverlay
            lutris
        ];
        programs.steam.enable = true;
        hardware.amdgpu.initrd.enable = true;
    }