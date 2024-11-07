{ pkgs, lib, ... }:
{
  config.plugins.none-ls = {
    enable = true;
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        actionlint = {
          enable = true;
          settings = ''
            {
              extra_args = { "-ignore", "'label .* is unknown.*'", "-shellcheck=${lib.getExe pkgs.shellcheck}", "-pyflakes=${lib.getExe pkgs.python311Packages.pyflakes}" },
            }
          '';
        };
        deadnix.enable = true;
        statix.enable = true;
      };
    };
  };
}
