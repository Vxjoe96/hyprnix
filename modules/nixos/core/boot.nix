{ config, pkgs, lib, ... }:
    {
        boot = {
            kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
            consoleLogLevel = 3;
            kernelParams = [
                "quiet"
                "splash"
                "systemd.show_status=auto"
                "rd.udev.log_level=3"
                "log_level=3"
            ];
            loader = {
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
                timeout = 5;
            };
            plymouth.enable = true;
            plymouth.extraConfig = 
                "
DeviceScale=1
                ";
            tmp.cleanOnBoot = true;
        };
        environment.systemPackages = with pkgs; [
            nixos-icons
        ];
    }