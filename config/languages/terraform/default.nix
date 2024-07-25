{
  plugins.lsp.servers = {
    tflint.enable = true;
    terraformls.enable = true;
  };
  extraConfigLua = builtins.readFile ./default.lua;
}
