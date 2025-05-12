{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      stylelint_lsp.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.css = [ "stylelint" ];
      formatters.stylelint.command = lib.getExe pkgs.stylelint;
    };
  };
}
