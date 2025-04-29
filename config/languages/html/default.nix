{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      html.enable = true;
      superhtml.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.html = [ "superhtml" ];
      formatters.superhtml.command = lib.getExe pkgs.superhtml;
    };
  };
}
