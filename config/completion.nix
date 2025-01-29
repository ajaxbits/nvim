{
  plugins = {
    luasnip.enable = true;
    copilot-cmp = {
      enable = true;
      settings.fixPairs = true;
    };
    copilot-lua = {
      settings = {
        panel.enabled = false;
        suggestion.enabled = false;
      };
    };
    cmp = {
      enable = true;
      settings = {
        sources = [
          {
            name = "nvim_lsp";
            group_index = 2;
          }
          {
            name = "nvim_lsp_signature_help";
            group_index = 2;
          }
          {
            name = "luasnip";
            group_index = 2;
          }
          {
            name = "copilot";
            group_index = 2;
          }
          {
            name = "buffer";
            group_index = 2;
          }
        ];
        sorting.comparators = [
          "require('cmp.config.compare').offset"
          "require('cmp.config.compare').exact"
          "require('copilot_cmp.comparators').prioritize"
          "require('cmp.config.compare').score"
          "require('cmp.config.compare').recently_used"
          "require('cmp.config.compare').locality"
          "require('cmp.config.compare').kind"
          "require('cmp.config.compare').length"
          "require('cmp.config.compare').order"
          "require('cmp.config.compare').order"
        ];

        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };
    };
  };

  diagnostics.float = {
    focusable = false;
    style = "minimal";
    border = "rounded";
    source = "always";
    header = "";
    prefix = "";
  };
}
