{
  plugins = {
    luasnip = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      fromVscode = [
        { }
        { paths = ../snippets; }
        { paths = "~/.vscode/snippets"; }
      ];
    };
    friendly-snippets.enable = true;
    copilot-lua = {
      enable = true;
      settings = {
        panel.enabled = false;
        suggestion.enabled = false;
      };
    };
    blink-cmp = {
      enable = true;
      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdLineEnter"
      ];
      settings = {
        signature.enabled = true;
        sources = {
          default = [
            "buffer"
            "copilot"
            "lsp"
            "path"
            "snippets"
          ];
          providers = {
            lsp.score_offset = 1000;
            snippets.score_offset = 900;
            path.score_offset = 700;
            copilot.score_offset = 600;
            buffer.score_offset = 500;

            copilot = {
              async = true;
              module = "blink-cmp-copilot";
              name = "copilot";
              transform_items.__raw = ''
                function(_, items)
                  local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                  local kind_idx = #CompletionItemKind + 1
                  CompletionItemKind[kind_idx] = "Copilot"
                  for _, item in ipairs(items) do
                    item.kind = kind_idx
                  end
                  return items
                end,
              '';
            };
          };
        };

        completion = {
          list = {
            selection = {
              preselect.__raw = ''
                function(ctx)
                  return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active({ direction = 1 })
                end
              '';
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
            treesitter_highlighting = true;
          };
          trigger.show_in_snippet = false;
          menu = {
            auto_show.__raw = ''
              function(ctx)
                return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
              end
            '';
            draw.treesitter = [ "lsp" ];
          };
        };

        snippets = {
          preset = "luasnip";
          expand.__raw = ''
            function(snippet) require('luasnip').lsp_expand(snippet) end
          '';
          active.__raw = ''
            function(filter)
              if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
              end
              return require('luasnip').in_snippet()
            end
          '';
          jump.__raw = ''
            function(direction) require('luasnip').jump(direction) end
          '';
        };

        appearance = {
          nerd_font_variant = "normal";
          kind_icons = {
            Copilot = "";
            Text = "󰉿";
            Method = "󰊕";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
          };

        };
      };
    };
    blink-cmp-copilot.enable = true;
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
