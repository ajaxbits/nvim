{ pkgs, ... }:
let
  inherit (pkgs) nodejs vimUtils fetchFromGitHub;
  inherit (pkgs.lib) getExe;
in
{
  extraPlugins = [
    (vimUtils.buildVimPlugin {
      name = "vim-dap-vscode-js";
      doCheck = false;
      # name = "nvim-dap-vscode-js";
      src = fetchFromGitHub {
        owner = "David-Kunz";
        repo = "jester";
        rev = "6679cdc24e4bdb2d61d0e71e3c65011029f166ef";
        hash = "sha256-0JmS1dynF8/nAPNTXzIfbrkxsUIWanOpTNYKWX46QrQ=";
      };
    })
  ];

  extraConfigLua = ''
    local dap = require("dap")
    local dap_vscode_js = require("dap-vscode-js")
    dap_vscode_js.setup({
      adapters = { 'pwa-node' },
      node_path = "${getExe nodejs}",
    })
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "''${file}",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run Application",
        program = "dist/index.js",
        cwd = "''${workspaceFolder}",
      },
    }
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "''${file}",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run Application",
        program = "dist/index.js",
        cwd = "''${workspaceFolder}",
      }
    }
  '';
}
