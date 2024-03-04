{pkgs, ...}: {
  config = {
    options.spell = true;
    options.spelllang = "en_us";

    plugins.none-ls = {
      enable = true;
      sources.completion.spell = {
        enable = true;
        withArgs = ''
          {
            filetypes = { "markdown", "plain", },
          }
        '';
      };
      sources.code_actions.proselint.enable = true;
      sources.code_actions.statix.enable = true;
      sources.diagnostics = {
        alex.enable = true;
        actionlint.enable = true;
        actionlint.withArgs = ''
          {
            extra_args = { "-ignore", "'label .* is unknown.*'", "-shellcheck=${pkgs.shellcheck}/bin/shellcheck", "-pyflakes=${pkgs.python311Packages.pyflakes}/bin/pyflakes" },
          }
        '';
        codespell.enable = true;
        deadnix.enable = true;
        proselint.enable = true;
        proselint.withArgs = ''
          {
            filetypes = { "markdown", "plain", },
          }
        '';
        statix.enable = true;
      };
    };
  };
}
