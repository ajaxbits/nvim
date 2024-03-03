{
  plugins = {
    nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";
      sources = [
        {name = "dap";}
        {name = "nvim_lsp";}
        {name = "nvim_lsp_document_symbol";}
        {name = "nvim_lsp_signature_help";}
        {name = "treesitter";}
        {name = "fuzzy_buffer";}
        {name = "fuzzy_path";}
        {name = "emoji";}
      ];
      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = {
          action = "cmp.mapping.select_prev_item()";
          modes = [
            "i"
            "s"
          ];
        };
        "<Tab>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [
            "i"
            "s"
          ];
        };
      };
    };
    luasnip.enable = true;

    copilot-vim = {
      enable = true;
      filetypes = {
        "*" = true;
        "markdown" = false;
      };
    };
  };
}
