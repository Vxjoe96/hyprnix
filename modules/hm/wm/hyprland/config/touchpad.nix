{ lib, pkgs, ... }:
{
    wayland.windowManager.hyprland.settings = {
        input.touchpad = {
            disable_while_typing = true;
            natural_scroll = true;
            clickfinger_behavior = true;
            tap-to-click = false;
            scroll_factor = .1;
        };
        gestures = {
            workspace_swipe = true;
            workspace_swipe_create_new = false;
        };
    };
}