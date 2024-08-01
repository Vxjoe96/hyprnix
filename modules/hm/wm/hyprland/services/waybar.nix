{ config, pkgs, inputs, ... }:
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
                        modules-right = ["tray" "battery"];
                        "custom/clock" = {
                            interval = 1;
                            exec = "date '+%-I:%M %p'";
                        };
                         "tray" = {
                            icon-size = 21;
                            spacing = 10;
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

                    #battery {
                        color: #ffffff;
                        padding: 0 15 0 0px;
                        background-color: transparent;
                        font-size: 15px;
                    }

                    #battery.charging, #battery.plugged {
                        color: #ffffff;
                        background-color: #26A65B;
                    }

                    @keyframes blink {
                        to {
                            background-color: #ffffff;
                            color: #000000;
                        }
                    }

                    /* Using steps() instead of linear as a timing function to limit cpu usage */
                    #battery.critical:not(.charging) {
                        background-color: #f53c3c;
                        color: #ffffff;
                        animation-name: blink;
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

                    label:focus {
                        background-color: #000000;
                    }

                    #cpu {
                        background-color: #2ecc71;
                        color: #000000;
                    }

                    #memory {
                        background-color: #9b59b6;
                    }

                    #disk {
                        background-color: #964B00;
                    }

                    #backlight {
                        background-color: #90b1b1;
                    }

                    #network {
                        background-color: #2980b9;
                    }

                    #network.disconnected {
                        background-color: #f53c3c;
                    }

                    #pulseaudio {
                        background-color: #f1c40f;
                        color: #000000;
                    }

                    #pulseaudio.muted {
                        background-color: #90b1b1;
                        color: #2a5c45;
                    }

                    #wireplumber {
                        background-color: #fff0f5;
                        color: #000000;
                    }

                    #wireplumber.muted {
                        background-color: #f53c3c;
                    }

                    #custom-media {
                        background-color: #66cc99;
                        color: #2a5c45;
                        min-width: 100px;
                    }

                    #custom-media.custom-spotify {
                        background-color: #66cc99;
                    }

                    #custom-media.custom-vlc {
                        background-color: #ffa000;
                    }

                    #temperature {
                        background-color: #f0932b;
                    }

                    #temperature.critical {
                        background-color: #eb4d4b;
                    }


                    #tray > .passive {
                        -gtk-icon-effect: dim;
                    }

                    #tray > .needs-attention {
                        -gtk-icon-effect: highlight;
                        background-color: #eb4d4b;
                    }

                    #idle_inhibitor {
                        background-color: #2d3436;
                    }

                    #idle_inhibitor.activated {
                        background-color: #ecf0f1;
                        color: #2d3436;
                    }

                    #mpd {
                        background-color: #66cc99;
                        color: #2a5c45;
                    }

                    #mpd.disconnected {
                        background-color: #f53c3c;
                    }

                    #mpd.stopped {
                        background-color: #90b1b1;
                    }

                    #mpd.paused {
                        background-color: #51a37a;
                    }

                    #language {
                        background: #00b093;
                        color: #740864;
                        padding: 0 5px;
                        margin: 0 5px;
                        min-width: 16px;
                    }

                    #keyboard-state {
                        background: #97e1ad;
                        color: #000000;
                        padding: 0 0px;
                        margin: 0 5px;
                        min-width: 16px;
                    }

                    #keyboard-state > label {
                        padding: 0 5px;
                    }

                    #keyboard-state > label.locked {
                        background: rgba(0, 0, 0, 0.2);
                    }

                    #scratchpad {
                        background: rgba(0, 0, 0, 0.2);
                    }

                    #scratchpad.empty {
                    	background-color: transparent;
                    }

                    #privacy {
                        padding: 0;
                    }

                    #privacy-item {
                        padding: 0 5px;
                        color: white;
                    }

                    #privacy-item.screenshare {
                        background-color: #cf5700;
                    }

                    #privacy-item.audio-in {
                        background-color: #1ca000;
                    }

                    #privacy-item.audio-out {
                        background-color: #0069d4;
                    }
                '';
        };
}