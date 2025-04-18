{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft =
        # NOTE: order in lists matters here!
        let
          jsFormatters = [ "prettierd" ];
        in
        {
          "*" = [
            "squeeze_blanks"
            "trim_newlines"
            "trim_whitespace"
          ];
          javascript = jsFormatters;
          javascriptreact = jsFormatters;
          json = [ "fixjson" ];
          python = [
            "ruff_format"
            "ruff_organize_imports"
          ];
          svelte = jsFormatters;
          typescript = jsFormatters;
          typst = [ "typstyle" ];
          typescriptreact = jsFormatters;
        };
      formatters = {
        prettierd.command = lib.getExe pkgs.prettierd;
        typstyle.command = lib.getExe pkgs.typstyle;
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
