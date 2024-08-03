{ ... }:
{
    programs.nixvim = {
        enable = true;
        plugins = {
            nvim-tree.enable = true;
            lualine.enable = true;

        };
    };
}