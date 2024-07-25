{ pkgs, config, ... }:
{
  config.plugins = {
    lsp.servers.typst-lsp.enable = true;
    treesitter.grammarPackages = config.plugins.treesitter.package.passthru.allGrammars ++ [
      pkgs.vimPlugins.nvim-treesitter-parsers.typst
    ];
  };
}
