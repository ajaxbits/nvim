{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        "*" = [ "trim_whitespace" ];
        json = [ "fixjson" ];
        python = [
          "ruff_format"
          "ruff_organize_imports"
        ];
      };
      formatters = {
        ruff_format.args = [
          "format"
          "--line-length=120"
          "--force-exclude"
          "--stdin-filename"
          "$FILENAME"
          "-"
        ];
        fixjson.command = lib.getExe pkgs.fixjson;
      };
    };
  };
  keymaps = [
    {
      options.desc = "Format code.";
      action.__raw = ''
        function ()
            return require("conform").format({
                lsp_format="fallback",
            })
        end
      '';
      key = "<leader>f";
      mode = [
        "n"
        "v"
      ];
      options.silent = true;
    }
  ];
}
