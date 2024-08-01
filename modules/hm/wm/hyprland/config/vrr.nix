{ lib, pkgs, ... }: 
{
    wayland.windowManager.hyprland.settings = {
        misc = {
            vrr = 2;
            vfr = false;
            no_direct_scanout = false;
        };
    };
}