{ pkgs, lib, ... }:
{
  plugins = {
    lsp = {
      enable = true;

      servers = {
        eslint.enable = true;
        pyright.enable = true;
        yamlls = {
          enable = true;
          settings.format = {
            enable = true;
            proseWrap = "Preserve";
          };
        };
        ruff.enable = true;
        html.enable = true;
        jsonls.enable = true;
        nil_ls = {
          enable = true;
          settings.formatting.command = [ (lib.getExe pkgs.nixfmt-rfc-style) ];
        };
        lua_ls = {
          enable = true;
          settings = {
            telemetry.enable = false;
            diagnostics.globals = [ "vim" ];
          };
        };
        gopls.enable = true;
      };
      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          grr = "rename";
        };
        diagnostic = {
          # Navigate in diagnostics
          "<leader>l[" = "goto_prev";
          "<leader>l]" = "goto_next";
          "<leader>lh" = "open_float";
        };
        silent = true;
      };
    };
    fastaction = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    trouble = {
      enable = true;
      lazyLoad.settings.cmd = "Trouble";
      settings = {
        auto_close = true;
        modes = {
          preview_split = {
            mode = "diagnostics";
            preview = {
              type = "split";
              relative = "win";
              position = "right";
              size = 0.5;
            };
          };
        };
      };
    };
    fidget.enable = true;
    glance = {
      enable = true;
      lazyLoad.settings.cmd = "Glance";
      settings = {
        border.enable = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble preview_split toggle<cr>";
      options = {
        desc = "Diagnostics toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble preview_split toggle filter.buf=0<cr>";
      options = {
        desc = "Buffer Diagnostics toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>us";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options = {
        desc = "Symbols toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options = {
        desc = "LSP Definitions / references / ... toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options = {
        desc = "Location List toggle";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = {
        desc = "Quickfix List toggle";
        silent = true;
      };
    }
    {
      options.desc = "Code action";
      action.__raw = # lua
        ''
          function()
            require('fastaction').code_action()
          end
        '';
      key = "<leader>ca";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      options.desc = "Code action for selection";
      action.__raw = # lua
        ''
          function()
            require('fastaction').range_code_action()
          end
        '';
      key = "<leader>ca";
      mode = [ "v" ];
      options.silent = true;
    }
    {
      action = "<CMD>Glance definitions<CR>";
      mode = "n";
      key = "<leader>lgd";
      options = {
        desc = "Glance definition";
      };
    }
    {
      action = "<CMD>Glance implementations<CR>";
      mode = "n";
      key = "<leader>lgi";
      options = {
        desc = "Glance implementation";
      };
    }
    {
      action = "<CMD>Glance references<CR>";
      mode = "n";
      key = "<leader>lgr";
      options = {
        desc = "Glance reference";
      };
    }
    {
      action = "<CMD>Glance type_definitions<CR>";
      mode = "n";
      key = "<leader>lgt";
      options = {
        desc = "Glance type definition";
      };
    }
  ];
}
