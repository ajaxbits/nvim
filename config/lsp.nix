{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        pyright.enable = true;
        terraformls.enable = true;
        yamlls.enable = true;
        ruff-lsp.enable = true;
        html.enable = true;
        jsonls.enable = true;
        nil_ls = {
          enable = true;
          settings.formatting.command = ["${pkgs.alejandra}/bin/alejandra"];
        };
        lua-ls.enable = true;
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
    rustaceanvim = {
      enable = true;
      dap = {
        autoloadConfigurations = true;
      };
      server = {
        settings = {
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
    fidget.enable = true;
    trouble.enable = true;
  };
  keymaps = [
    {
      options.desc = "Format code.";
      action = "vim.lsp.buf.format";
      lua = true;
      key = "<leader>lf";
      mode = ["n" "v"];
      options.silent = true;
    }
    {
      options.desc = "Toggle diagnostics window.";
      action = "<cmd>TroubleToggle<cr>";
      key = "<leader>xx";
      mode = ["n"];
      options.silent = true;
    }
  ];
}
