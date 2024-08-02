{ pkgs, ... }:
    {
        environment.variables.NIXOS_OZONE_WL = "1";
        programs.hyprland.enable = true;
        security.pam.services.hyprlock = {};
        services.udisks2.enable = true;
        environment.systemPackages = with pkgs; [
            polkit_gnome
        ];
        security.polkit = {
            enable = true;
        };
    }