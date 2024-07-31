{ config, pkgs, inputs, ... }:
    {
        services.dunst = 
            {
                enable = true;
                settings = 
                    {
                        global = 
                            {
                                width = 300;
                                height = 300;
                                offset = "50x50";
                                origin = "bottom-right";
                                transparency = 10;
                                frame_color = "#323333";
                                font = "JetBrainsMono 10";
                                word_wrap = "no";
                            };
                        urgency_normal = 
                            {
                            background = "#323333";
                            foreground = "#c5c6c7";
                            timeout = 10;
                            };
                    };
            };
    }        
