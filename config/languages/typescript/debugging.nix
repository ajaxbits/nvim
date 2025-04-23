{
  pkgs,
  lib,
  ...
}:
let
  inherit (pkgs) nodejs vimUtils fetchFromGitHub;
  inherit (pkgs.lib) getExe;
in
lib.mkIf lib.nixvim.enableExceptInTests {
  extraPlugins = [
    (vimUtils.buildVimPlugin {
      name = "vim-dap-vscode-js";
      doCheck = false;
      # name = "nvim-dap-vscode-js";
      src = fetchFromGitHub {
        owner = "mxsdev";
        repo = "nvim-dap-vscode-js";
        rev = "03bd29672d7fab5e515fc8469b7d07cc5994bbf6";
        hash = "sha256-8dlzaI94I8ppzLRNIfjVd92kYgqr07D1akDj4VdKQto=";
      };
    })
  ];
  # -- local dap_vscode_js = require("dap-vscode-js")
  # -- dap_vscode_js.setup({
  # --   adapters = { 'node-terminal', 'pwa-node' },
  # --   node_path = "${getExe nodejs}",
  # --   debugger_cmd = { "${getExe pkgs.vscode-js-debug}" },
  # -- })
  #
  extraConfigLua = ''
    local dap = require("dap")
    dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "8123",
        executable = {
            command = '${getExe pkgs.vscode-js-debug}',
            args = {
                '8123',
            },
        },
    }
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
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "''${workspaceFolder}",
        cwd = "''${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
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
