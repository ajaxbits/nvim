{ pkgs, lib, ... }:
let
  inherit (lib.meta) getExe;
  sqlfluff = getExe pkgs.sqlfluff;
in
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft.sql = [ "sqlfluff" ];
      formatters.sqlfluff = {
        args = [
          "fix"
          "--dialect"
          "sqlite"
          "--disable-progress-bar"
          "-f"
          "-n"
          "-"
        ];
        command = sqlfluff;
        stdin = true;

      };
    };
  };

  plugins.lint = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    linters.sqlfluff.cmd = sqlfluff;
    lintersByFt.sql = [ "sqlfluff" ];
  };
}
