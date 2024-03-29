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
    fidget.enable = true;
    trouble.enable = true;
    rust-tools.enable = true;
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
