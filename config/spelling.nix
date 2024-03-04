{lib, ...}: let
  inherit (lib) concatStringsSep;
  ignoredWords = [
    "crate"
  ];
in {
  config = {
    options.spell = true;
    options.spelllang = "en_us";

    plugins.none-ls = {
      enable = true;
      sources = {
        completion.spell = {
          enable = true;
          withArgs = ''
            {
              filetypes = { "markdown", "plain", },
            }
          '';
        };
        code_actions.proselint.enable = true;
        diagnostics = {
          alex.enable = true;
          codespell = {
            enable = true;
            withArgs = ''
              {
                extra_args = { "-L${concatStringsSep "," ignoredWords}" },
              }'';
          };
          proselint = {
            enable = true;
            withArgs = ''
              {
                filetypes = { "markdown", "plain", },
              }
            '';
          };
        };
      };
    };
  };
}
