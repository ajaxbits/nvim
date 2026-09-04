{ lib, ... }:
{
  config = {
    keymaps = [
      {
        options.desc = "List available Python virtual envs";
        action = "<cmd>VenvSelect<cr>";
        key = "<leader>ov";
        options.silent = true;
        mode = [ "n" ];
      }
    ];

    plugins = {
      venv-selector = {
        enable = true;
        lazyLoad.settings.cmd = [ "VenvSelect" ];
        settings = {
          auto_refresh = false;
          dap_enabled = true;
        };
      };
      lsp = {
        enable = true;
        servers = {
          pyright.enable = lib.mkForce false;
          ty = {
            enable = true;
            settings = {
              diagnosticMode = "workspace";
            };
          };
          ruff = {
            enable = true;
            extraOptions.init_options.settings = {
              lineLength = 120;
            };
          };
        };
      };
    };
  };
}
