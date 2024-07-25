{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        pyright.enable = true;
        yamlls.enable = true;
        ruff-lsp.enable = true;
        html.enable = true;
        jsonls.enable = true;
        nil-ls = {
          enable = true;
          settings.formatting.command = ["${pkgs.nixfmt-rfc-style}/bin/nixfmt"];
        };
        lua-ls = {
          enable = true;
          settings = {
            telemetry.enable = false;
            diagnostics.globals = ["vim"];
          };
        };
        gopls.enable = true;
      };
      keymaps.lspBuf = {
        "<leader>f" = "format";
        "cd" = "rename";
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>ca" = "code_action";
      };
      keymaps.silent = true;
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
      mode = ["n"];
      options.silent = true;
    }
  ];
}
