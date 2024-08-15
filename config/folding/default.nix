{
  plugins.nvim-ufo = {
    enable = true;
  };
  plugins.lsp.capabilities = ''
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  '';
  extraConfigLua = builtins.readFile ./ufo.lua;
}
