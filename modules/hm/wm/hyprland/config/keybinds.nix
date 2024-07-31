{ lib, pkgs, ... }:
let 
    powermenu = import ../scripts/powermenu.nix pkgs;
    modBinds = builtins.map (x: "SUPER, " + x) [
        # Apps
        "Q, exec, kitty"
        "E, exec, nautilus"
        "R, exec, fuzzel"
        # Windows
        "M, exit,"
        "C, killactive,"
        "V, togglefloating,"
        "P, pseudo, "
        "J, togglesplit,"
        "F, fullscreen,"
        "TAB, cyclenext,"
        # Power Menu
        "ESCAPE, exec, ${lib.getExe powermenu.powermenu}"
        # Workspaces
        "1, workspace, 1"
        "2, workspace, 2"
        "3, workspace, 3"
        "4, workspace, 4"
        "5, workspace, 5"
        "6, workspace, 6"
        "S, togglespecialworkspace, settings"
        "D, togglespecialworkspace, discord"
        "RETURN, togglespecialworkspace, terminal"
        "mouse_down, workspace, e+1"
        "mouse_up, workspace, e-1"
    ];

    modshiftBinds = builtins.map (x: "SUPER SHIFT, " + x) [
        "1, movetoworkspace, 1"
        "2, movetoworkspace, 2"
        "3, movetoworkspace, 3"
        "4, movetoworkspace, 4"
        "5, movetoworkspace, 5"
        "6, movetoworkspace, 6"
        "7, movetoworkspace, 7"
        "8, movetoworkspace, 8"
        "9, movetoworkspace, 9"
        "0, movetoworkspace, 10"
    ];
    mouseBinds = builtins.map (x: "SUPER, " + x) [
        "mouse:272, movewindow"
        "mouse:273, resizewindow"
    ];
in 

    {
        wayland.windowManager.hyprland.settings= {
            bind = modBinds ++ modshiftBinds;
            bindm = mouseBinds;
        };
    }
