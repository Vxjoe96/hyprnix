{ ... }:
    {
        programs.kitty = 
            {
                enable = true;
                font.name = "JetBrainsMono NFM";
                shellIntegration.enableBashIntegration = true;
                shellIntegration.mode = "no-cursor";
                settings = 
                {
                    confirm_os_window_close = 0;
                };
            };
    }