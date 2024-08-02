{ pkgs, ... }:
    {
        home.packages = 
            [
                pkgs.nil
                pkgs.nixpkgs-fmt
            ];
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
                        "nix.serverSettings.nil.formatting.command" = ["nixpkgs-fmt"];
                        "nix.serverSettings.nil.nix.flake.autoArchive" = true;
                        "nix.serverSettings.nil.nix.flake.autoEvalInputs" = true;
                        "nix.serverSettings.nil.nix.maxMemoryMB" = 6500;
                        "nix.enableLanguageServer" = true;
                        "nix.serverPath" = "nil";
                    };
            };
    }