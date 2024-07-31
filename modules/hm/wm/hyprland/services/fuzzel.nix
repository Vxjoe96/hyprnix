{ config, pkgs, inputs, ... }:
{
    programs.fuzzel.enable = true;
    programs.fuzzel.settings = {
        main = {
            terminal = "${pkgs.kitty}/bin/kitty";
            layer = "overlay";
            font = "Jetbrains-Mono:size=20";
            lines = 10;
            width = 20;
        };
        colors.background = "000000ff";
        colors.text = "ffffffff";
        colors.selection = "3d3d3dff";
        colors.selection-text = "ffffffff";
        colors.border = "000000ff";
    };
}