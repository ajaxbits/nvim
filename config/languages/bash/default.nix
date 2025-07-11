{ pkgs, lib, ... }:
let
  inherit (lib.attrsets) listToAttrs;
  inherit (lib.meta) getExe;

  formatters = [
    "shellcheck"
    "shfmt"
    "shellharden"
  ];

  formattersPackages = listToAttrs (
    map (tool: {
      name = tool;
      value = {
        command = getExe pkgs.${tool};
      };
    }) formatters
  );
in
{
  plugins = {
    lsp.servers = {
      bashls.enable = true;
    };
    conform-nvim.settings = {
      formatters = formattersPackages;
      formatters_by_ft.bash = formatters;
    };
  };
}
