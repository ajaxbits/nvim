{
  config = {
    plugins = {
      venv-selector = {
        enable = true;
        lazyLoad.settings.ft = [ "python" ];
        settings = {
          dap_enabled = true;
        };
      };
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
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
