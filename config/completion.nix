{
  pkgs,
  config,
  ...
}: {
  extraPlugins = with pkgs.vimPlugins; [vim-vsnip];

  extraConfigLua = ''
    require("cmp").event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done()
    )
  '';

  plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = ''
          function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        '';
        sources = [
          {name = "copilot";}
          {name = "dap";}
          {name = "nvim_lsp";}
          {name = "nvim_lsp_signature_help";}
          {name = "luasnip";}
          {name = "buffer";}
        ];
      };
    };
  };
}
