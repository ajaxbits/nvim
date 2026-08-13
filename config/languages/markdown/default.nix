{ pkgs, lib, ... }:
let
  inherit (lib.meta) getExe;
  rumdl = getExe pkgs.rumdl;
in
{
  plugins = {
    render-markdown = {
      enable = true;
      lazyLoad.settings.ft = [
        "markdown"
      ];
      settings = {
        heading = {
          sign = false;
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft.markdown = [ "rumdl" ];
        formatters.rumdl = {
          command = rumdl;
          args = [
            "fmt"
            "--silent"
            "-"
          ];
          stdin = true;
        };
      };
    };
  };
}
