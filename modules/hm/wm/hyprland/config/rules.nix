{ lib, pkgs, ... }:
let
    float = builtins.map (x: "float, " + x) [
        "class:^(pavucontrol)$"
        "class:^(nm-connection-editor)$"
        "class:^(org.gnome.Nautilus)$,title:^(Home:)$"
        "class:^(coolercontrol)$"
        "class:^(kitty)$"
        "title:(Open File)$"
    ];

    size = builtins.map (x: "size " + x) [
        "50% 50%, title:(Open File)$"
        "50% 50%, class:^(kitty)$"
        "50% 50%, class:^(coolercontrol)$"
        "30% 30%, class:^(pavucontrol)$"
        "30% 30%, class:^(nm-connection-editor)$"
    ];

    move = builtins.map (x: "move " + x) [
        "10% 30%, class:^(pavucontrol)$"
        "60% 30%, class:^(nm-connection-editor)$"
    ];

    opaque = builtins.map (x: "opaque, " + x) [
        "class:^(pavucontrol)$"
        "class:^(nm-connection-editor)$"

    ];

    workspacespecialwindow = builtins.map (x: "workspace special:" + x) [
        "settings, class:^(pavucontrol)$"
        "settings, class:^(nm-connection-editor)$"
        "discord, class:^(vesktop)$"
    ];

    idle = builtins.map (x: "idleinhibit focus, " + x) [
        "title:(WorkLaptop)$"
    ];

    suppresseventmaximize = ["suppressevent maximize, class:.*"];


    in
    { 
    wayland.windowManager.hyprland.settings= {
        windowrulev2 = float ++ size ++ move ++ opaque ++ workspacespecialwindow ++ idle ++ suppresseventmaximize;
    };
    }