{ ... }:
{
    programs.waybar = 
        {
            enable = true;
            settings = 
                {
                    mainBar = {    
                        height = 30;
                        spacing = 4;
                        modules-left = ["hyprland/workspaces"];
                        modules-center = ["custom/clock"];
                        modules-right = [ "tray" "network" "battery"];
                        "custom/clock" = {
                            interval = 1;
                            exec = "date '+%-I:%M %p'";
                        };
                         "tray" = {
                            icon-size = 20;
                            spacing = 10;
                        };
                         "network" = {
                            format = "";
                            format-wifi = "";
                            format-ethernet = "";
                            format-disconnected = "";
                            tooltip-format-ethernet = "{ifname}\n{ipaddr}\n{gwaddr}";
                            tooltip-format-wifi = "{essid}-{frequency}\nStrength {signalStrength}%";
                         };
                         "battery" = {
                            interval = 60;
                            states = {
                                "warning" = 30;
                                "critical" = 15;
                            };
                            format = "{icon}";
                            format-icons = ["" "" "" "" ""];
                         };
                        "hyprland/workspaces" = {
	                    format = "{icon}";
	                    format-icons = {
	                    	"1" = "";
	                    	"2" = "";
	                    	"3" = "󰢹";
	                    	"4" = "";
	                    	"5" = "";
	                    };
                           "persistent-workspaces" = {
                                 "*" = 5;
                           };
                        };
                    };
                };
            style = 
                ''
                                    * {
                        font-family: jetbrainsmono;
                        font-size: 13px;
                    }

                    window#waybar {
                        background-color: rgba(255, 255, 255, 0);
                        color: white;
                    }

                    button {
                        /* Use box-shadow instead of border so the text isn't offset */
                        box-shadow: inset 0 -3px transparent;
                        /* Avoid rounded borders under each button name */
                        border: none;
                        border-radius: 0;
                    }

                    #workspaces button label {
                        font-size: 20px;
                      }
                    #workspaces button {
                        padding-right: 16px;
                        padding-left: 10px;
                        background-color: transparent;
                        color: #ffffff;
                    }

                    #workspaces button:hover {
                        background: rgba(0, 0, 0, 0.2);
                    }

                    #workspaces button.active {
                        background-color: #64727D;
                        box-shadow: inset 0 -3px #ffffff;
                    }

                    #workspaces button.urgent {
                        background-color: #eb4d4b;
                    }

                    #mode {
                        background-color: #64727D;
                        box-shadow: inset 0 -3px #ffffff;
                    }

                    #clock,
                    #cpu,
                    #memory,
                    #disk,
                    #temperature,
                    #backlight,
                    #network,
                    #pulseaudio,
                    #wireplumber,
                    #custom-media,
                    #tray,
                    #mode,
                    #idle_inhibitor,
                    #scratchpad,
                    #power-profiles-daemon,
                    #mpd {
                        padding: 0 10px;
                        color: #ffffff;
                    }

                    #window,
                    #workspaces {
                        margin: 0 4px;
                    }

                    /* If workspaces is the leftmost module, omit left margin */
                    .modules-left > widget:first-child > #workspaces {
                        margin-left: 0;
                    }

                    /* If workspaces is the rightmost module, omit right margin */
                    .modules-right > widget:last-child > #workspaces {
                        margin-right: 0;
                    }

                    #custom-clock {
                        font-size: 15px;
                        font-weight: bold;
                    }
                    #network,
                    #network.disconnected,
                    #battery {
                        color: #ffffff;
                        padding: 0 15 0 0px;
                        background-color: transparent;
                        font-size: 15px;
                    }
                    #network.ethernet {
                        font-size: 18px;
                    }
                    
                    @keyframes battplugged {
                        to {
                            background-color: transparent;
                            color: #000000;
                        }
                    }

                    #battery.charging, #battery.plugged {
                        color: #26A65B;
                        background-color: transparent;
                        animation-name: battplugged;
                        animation-duration: 0.5s;
                        animation-timing-function: steps(12);
                        animation-iteration-count: 1;
                        animation-direction: alternate;
                    }

                    @keyframes battcrit {
                        to {
                            background-color: transparent;
                            color: #000000;
                        }
                    }

                    /* Using steps() instead of linear as a timing function to limit cpu usage */
                    #battery.critical:not(.charging) {
                        background-color: transparent;
                        color: #f53c3c;
                        animation-name: battcrit;
                        animation-duration: 0.5s;
                        animation-timing-function: steps(12);
                        animation-iteration-count: infinite;
                        animation-direction: alternate;
                    }

                    #power-profiles-daemon {
                        padding-right: 15px;
                    }

                    #power-profiles-daemon.performance {
                        background-color: #f53c3c;
                        color: #ffffff;
                    }

                    #power-profiles-daemon.balanced {
                        background-color: #2980b9;
                        color: #ffffff;
                    }

                    #power-profiles-daemon.power-saver {
                        background-color: #2ecc71;
                        color: #000000;
                    }

                    #tray > .passive {
                        -gtk-icon-effect: dim;
                    }

                    #tray > .needs-attention {
                        -gtk-icon-effect: highlight;
                        background-color: #eb4d4b;
                    }
                '';
        };
}