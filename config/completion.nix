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
          {name = "treesitter";}
          {name = "fuzzy_path";}
          {name = "fuzzy_buffer";}
          {name = "emoji";}
        ];
        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<CR>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };
      };
    };

    copilot-lua = {
      enable = true;
      panel.enabled = !config.plugins.cmp.enable;
      suggestion.enabled = !config.plugins.cmp.enable;
      filetypes = {
        markdown = false;
        yaml = true;
      };
    };
  };
}
