{pkgs, ...}: {
  config = {
    opts = {
      spell = true;
      spelllang = "en_us";
    };

    plugins.none-ls = {
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
                extra_args = { "-ignore", "'label .* is unknown.*'", "-shellcheck=${pkgs.shellcheck}/bin/shellcheck", "-pyflakes=${pkgs.python311Packages.pyflakes}/bin/pyflakes" },
              }
            '';
          };
          deadnix.enable = true;
          statix.enable = true;
        };
      };
    };
  };
}
