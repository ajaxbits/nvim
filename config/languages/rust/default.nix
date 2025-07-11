{ pkgs, lib, ... }:
let
  inherit (lib.meta) getExe;
in
{
  plugins = {
    conform-nvim.settings = {
      formatters.rustfmt.command = getExe pkgs.rustfmt;
      formatters_by_ft.rust = [ "rustfmt" ];
    };
    rustaceanvim = {
      enable = true;
      settings = {
        dap = {
          autoloadConfigurations = true;
        };
        server = {
          default_settings.rust-analyzer = {
            cargo = {
              buildScripts.enable = true;
              features = "all";
            };
            diagnostics = {
              enable = true;
              styleLints.enable = true;
            };
            files = {
              excludeDirs = [
                ".cargo"
                ".direnv"
                ".git"
                "node_modules"
                "target"
              ];
            };
            inlayHints = {
              bindingModeHints.enable = true;
              closureStyle = "rust_analyzer";
              closureReturnTypeHints.enable = "always";
              discriminantHints.enable = "always";
              expressionAdjustmentHints.enable = "always";
              implicitDrops.enable = true;
              lifetimeElisionHints.enable = "always";
              rangeExclusiveHints.enable = true;
            };
            procMacro = {
              enable = true;
            };
            rustc.source = "discover";
          };
        };
      };
    };
  };
}
