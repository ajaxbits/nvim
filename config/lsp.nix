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
      };
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>lf" = "format";
      };
      keymaps.silent = true;
    };
    fidget.enable = true;
    trouble.enable = true;
  };
    keymaps = [
      {
        options.desc = "Toggle diagnostics window.";
        action = "<cmd>TroubleToggle<cr>";
        key = "<leader>xx";
	mode = ["n"];
        options.silent = true;
      }
      {
        options.desc = "Toggle TODOs.";
        action = "<cmd>TodoTrouble<cr>";
        key = "<leader>xt";
	mode = ["n"];
        options.silent = true;
      }
    ];
}
