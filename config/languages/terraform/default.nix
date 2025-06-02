{ pkgs, lib, ... }:
{
  plugins.lsp.servers = {
    tflint.enable = true;
    terraformls.enable = true;
  };
  plugins.conform-nvim.settings = {
    formatters_by_ft.terraform = [ "terraform_fmt" ];
    formatters.terraform_fmt.command = lib.getExe pkgs.opentofu;
  };
  extraConfigLua = builtins.readFile ./default.lua;
}
