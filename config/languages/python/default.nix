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
