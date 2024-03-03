{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [vim-vsnip];

  extraConfigLua = ''
    require("cmp").event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done()
    )
  '';

  plugins = {
    nvim-cmp = {
      enable = true;
      snippet.expand = "vsnip";
      sources = [
        {name = "dap";}
        {name = "nvim_lsp";}
        {name = "nvim_lsp_signature_help";}
        {name = "treesitter";}
        {name = "fuzzy_path";}
        {name = "fuzzy_buffer";}
        {name = "emoji";}
      ];
      mapping = {
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<CR>" = {
          action = ''
               function(fallback)
                 if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                 else
            fallback()
                 end
               end
          '';
          modes = ["i"];
        };
      };
    };

    copilot-vim = {
      enable = true;
      filetypes = {
        "*" = true;
        "markdown" = false;
      };
    };
  };
}
