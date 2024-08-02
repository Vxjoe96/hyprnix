{ config, pkgs, inputs, ... }:
    {
        programs.vscode = 
            {
                enable = true;
                userSettings = 
                    {
                        "terminal.integrated.fontFamily" = "JetBrainsMono NFM";
                        "terminal.integrated.fontSize" = 15;
                        "explorer.confirmDragAndDrop" = false;
                        "terminal.integrated.fontWeight" = "normal";
                        "editor.fontFamily" = "JetBrainsMono NFM";
                        "git.enableSmartCommit" = true;
                    };
            };
    }