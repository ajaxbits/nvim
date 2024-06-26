{
  config = {
    plugins.nvim-ufo = {
      enable = true;
    };
    plugins.lsp.capabilities = ''
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    '';

    opts = {
      foldcolumn = "1";
      fillchars = {
        eob = " ";
        fold = " ";
        foldopen = "";
        foldsep = " ";
        foldclose = "";
      };
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
  };
}
