{
  plugins = {
    lsp.servers.astro.enable = true;
    conform-nvim.settings = {
      formatters_by_ft.astro = [ "prettierd" ];
    };
  };
}
