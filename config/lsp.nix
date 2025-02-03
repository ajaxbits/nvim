{ pkgs, lib, ... }:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
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
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>ca" = "code_action";
      };
      keymaps.silent = true;
    };
    fastaction = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      lazyLoad.settings.keys = [
        {
          desc = "Code Action";
          __unkeyed-1 = "<leader>ca";
          __unkeyed-3.__raw = # lua
            ''
              function()
                require('fastaction').code_action()
              end
            '';
        }
      ];
    };
    trouble = {
      enable = true;
    };
    rustaceanvim = {
      enable = true;
      settings = {
        dap = {
          autoloadConfigurations = true;
        };
        server = {
          default_settings.rust-analyzer = {
            cargo = {
              buildScripts.enable = true;
              features = "all";
            };
            diagnostics = {
              enable = true;
              styleLints.enable = true;
            };
            files = {
              excludeDirs = [
                ".cargo"
                ".direnv"
                ".git"
                "node_modules"
                "target"
              ];
            };
            inlayHints = {
              bindingModeHints.enable = true;
              closureStyle = "rust_analyzer";
              closureReturnTypeHints.enable = "always";
              discriminantHints.enable = "always";
              expressionAdjustmentHints.enable = "always";
              implicitDrops.enable = true;
              lifetimeElisionHints.enable = "always";
              rangeExclusiveHints.enable = true;
            };
            procMacro = {
              enable = true;
            };
            rustc.source = "discover";
          };
        };
      };
    };
    fidget.enable = true;
  };
  keymaps = [
    {
      options.desc = "Toggle diagnostics window.";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xx";
      mode = [ "n" ];
      options.silent = true;
    }
  ];
}
