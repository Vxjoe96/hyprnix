{ config, pkgs, inputs, ... }:
    let
          wallpaper = ../../../../../wallpapers/Minimal-Pack-7.jpg;
        in 
    {
        services.udiskie = {
            enable = true;
            tray = "never";
        };
        
        services.hyprpaper = 
            {
                enable = true;
                settings = 
                    {
                        preload = ["${wallpaper}"];
                        wallpaper = [",${wallpaper}"];
                        splash = false;
                    };
            };
        services.hypridle = 
            {
                enable = true;
                settings = 
                    {
                        general = {
                            lock_cmd = "pidof hyprlock || hyprlock";
                            before_sleep_cmd = "loginctl lock-session";
                            after_sleep_cmd = "hyprctl dispatch dpms on";
                        };

                        listener = [
                        {
                            timeout = 300;
                            on-timeout = "loginctl lock-session";
                        }
                        {
                            timeout = 301;         
                            on-timeout = "hyprctl dispatch dpms off";
                            on-resume = "hyprctl dispatch dpms on";
                        }
                        {
                            timeout = 1800;             
                            on-timeout = "systemctl suspend";                
                        }
                        ];
                    };
            };
        programs.hyprlock = 
            {
                enable = true;
                settings = 
                    {
                        background = [
                            {
                            monitor = "";
                            path = "${wallpaper}";
                            color = "$color7";
                            blur_size = 2;
                            blur_passes = 2;
                            noise = 0.0117;
                            contrast = 1.3000;
                            brightness = 0.8000;
                            vibrancy = 0.2100;
                            vibrancy_darkness = 0.0;
                            }
                        ];
                        input-field = [
                            {
                            monitor = "";
                            size = "250, 50";
                            outline_thickness = 3;
                            dots_size = 0.2;
                            dots_spacing = 0.64;
                            dots_center = true;
                            outer_color = "$color1";
                            inner_color = "$color0";
                            font_color = "$color7";
                            fade_on_empty = true;
                            hide_input = false;
                            position = "0, 50";
                            halign = "center";
                            valign = "bottom";
                            }
                        ];
                        label = [ 
                            {
                            monitor = "";
                            text = 
                            ''
                            cmd[update:1000] echo "<b><big> $(date +"%-I:%M %p") </big></b>"
                            '';
                            color = "$color0";
                            font_size = 45;
                            font_family = "JetBrains Mono Nerd Font 10";
                            position = "0, 16";
                            halign = "center";
                            valign = "center";
                            }
                            {
                            monitor = "";
                            text = 
                            ''
                            Hey <span text_transform="capitalize" >$USER</span>
                            '';
                            color =" $color0";
                            font_size = 20;
                            font_family = "JetBrains Mono Nerd Font 10";
                            position = "0, -15";
                            halign = "center";
                            valign = "center";
                           }
                        ];
                    };
            };
    }