{ pkgs, ... }:
{
  config = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          ruff = {
            enable = true;
            extraOptions.init_options.settings = {
              lineLength = 120;
            };
          };
        };
      };
    };

    extraConfigLua = builtins.readFile ./venv-selector.lua;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "venv-selector.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "linux-cultist";
          repo = "venv-selector.nvim";
          rev = "e82594274bf7b54387f9a2abe65f74909ac66e97";
          hash = "sha256-AyxITaKoeM+l+RbFp2UWy0zVrxrIxy8S/oDJsEr/VDQ=";
        };
        doCheck = false; # Tests are broken for some reason
      })
    ];
  };
}
