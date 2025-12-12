{ pkgs, lib, ... }:
{
  plugins = {
    dap.enable = true;
    dap-python = {
      enable = true;
      testRunner = "pytest";
      lazyLoad.settings.ft = [ "python" ];
    };
    dap-ui = {
      enable = true;
      lazyLoad.settings = {
        cmd = [
          "DapContinue"
          "DapToggleBreakpoint"
          "DapStepOver"
          "DapStepInto"
          "DapStepOut"
        ];
      };
    };
    dap-virtual-text.enable = true;
  };

  # extraPlugins = with pkgs.vimUtils; [
  #   (buildVimPlugin {
  #     # name = "vim-dap-vscode-js";
  #     name = "nvim-dap-vscode-js";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "mxsdev";
  #       repo = "nvim-dap-vscode-js";
  #       rev = "03bd29672d7fab5e515fc8469b7d07cc5994bbf6";
  #       hash = "sha256-8dlzaI94I8ppzLRNIfjVd92kYgqr07D1akDj4VdKQto=";
  #     };
  #   })
  # ];

  extraConfigLua = ''
    require("dap").listeners.before.attach.dapui_config = function()
      require("dapui").open()
    end
    require("dap").listeners.before.launch.dapui_config = function()
      require("dapui").open()
    end
  '';

  keymaps = [
    {
      key = "<leader>dd";
      action = "<cmd> DapContinue<CR>";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>ds";
      action = "<cmd> DapTerminate<CR>";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>di";
      action = "<cmd> DapStepInto<CR>";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>do";
      action = "<cmd> DapStepOut<CR>";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>dt";
      action.__raw = "require('dapui').toggle";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>dl";
      action = "<cmd> DapLoadLaunchJSON<CR>";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      key = "<leader>db";
      action = "<cmd> DapToggleBreakpoint<CR>";
      options.silent = true;
      mode = [
        "n"
        "v"
      ];
    }
    {
      key = "<C-k>";
      action.__raw = "require('dapui').eval";
      options.silent = true;
      mode = [ "v" ];
    }
  ];
}
