{ config, pkgs, inputs, lib, ... }:
{
  imports = 
    [
      ./services
      ./gtk.nix
      ./config
    ];
home.packages = 
[
  pkgs.hyprpaper
  pkgs.pavucontrol
  pkgs.networkmanagerapplet
  pkgs.udiskie
  pkgs.libnotify
  pkgs.git
];
xdg.portal = {
  enable = true;
  xdgOpenUsePortal = true;
  config = {
    common.default = ["gtk"];
    hyprland.default = ["hyprland" "gtk"];
  };
  extraPortals = [pkgs.xdg-desktop-portal-gtk];
};
wayland.windowManager.hyprland.enable = true;
wayland.windowManager.hyprland.systemd.variables = ["--all"];
  wayland.windowManager.hyprland.settings = {
    monitor = 
      [
        ",highrr,auto,auto"
      ];
    exec-once = 
      [
        "waybar"
        "hyprpaper"
        "hypridle"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      ];
    general = 
      {
        "gaps_in" = "5";
        "gaps_out" = "20";
        "border_size" = "2";
        "col.active_border" = "rgba(000000aa)";
        "col.inactive_border" = "rgba(000000aa)";
        "resize_on_border" = "false";
        "allow_tearing" = "false";
        "layout" = "dwindle";
      };
    decoration =
      {
        "rounding" = "10";
        "active_opacity" = "1.0";
        "inactive_opacity" = "0.9";
        "drop_shadow" = "true";
        "shadow_range" = "4";
        "shadow_render_power" = "3";
        "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";
          "vibrancy" = "0.1696";
        }; 
      };
    animations = 
      {
        "enabled" = "true";
        "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = 
        [
          "windows, 1, 2, default , slide"
          "windowsOut, 1, 7, default, popin 80%"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          "specialWorkspace, 1, 6, default, slidevert"
        ];
      };
    dwindle = {
      "pseudotile" = "true";
      "preserve_split" = "true";
    };
    master = {
      "new_status" = "master";
    };
    misc = 
      {
        "force_default_wallpaper" = "0";
        "disable_hyprland_logo" = "true";
        "vrr" = "2";
        "vfr" = "false";
        "no_direct_scanout" = "false";
      };
    workspace = 
      [
        "special:settings, on-created-empty:pavucontrol & nm-connection-editor"
        "special:terminal, on-created-empty:kitty"
        "special:discord, on-created-empty:vesktop"
      ];
  };
}