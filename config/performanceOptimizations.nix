{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = {
    luaLoader.enable = true;
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };

      # All credit to dwf for this one, and the overseer fix. Thank you!
      # https://github.com/dwf/dotfiles/blob/54a62ca9ed671f204a56414d37fa901dd6771b94/neovim/performance.nix
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          # Collisions
          "blink.cmp"
          "nvim-treesitter"
          "nvim-treesitter-textobjects"
          "oil.nvim"
          "vimplugin-treesitter-grammar-nix"
          "yanky.nvim"
        ];
      };
    };
    plugins.overseer.package =
      lib.mkIf (config.plugins.overseer.enable && config.plugins.conform-nvim.enable)
        (
          pkgs.vimPlugins.overseer-nvim.overrideAttrs {
            # conform and overseer fight
            postInstall = ''
              mv $out/doc/recipes.md $out/doc/overseer-recipes.md
            '';
          }
        );
  };
}
