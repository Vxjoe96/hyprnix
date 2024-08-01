{ lib, pkgs, ... }:
{
    wayland.windowManager.hyprland.settings = {
        touchpad = {
            disable_while_typing = true;
            natural_scroll = true;
            clickfinger_behavior = true;
            tap-to-click = false;
        };
        gestures = {
            workspace_swipe = true;
            workspace_swipe_create_new = false;
        };
    };
}