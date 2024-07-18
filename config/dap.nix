{
  plugins.dap = {
    enable = true;
    extensions = {
      dap-python = {
        enable = true;
        testRunner = "pytest";
      };
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };
  };

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
      mode = ["n"];
    }
    {
      key = "<leader>ds";
      action = "<cmd> DapTerminate<CR>";
      options.silent = true;
      mode = ["n"];
    }
    {
      key = "<leader>di";
      action = "<cmd> DapStepInto<CR>";
      options.silent = true;
      mode = ["n"];
    }
    {
      key = "<leader>do";
      action = "<cmd> DapStepOut<CR>";
      options.silent = true;
      mode = ["n"];
    }
    {
      key = "<leader>dt";
      action.__raw = "require('dapui').toggle";
      options.silent = true;
      mode = ["n"];
    }
    {
      key = "<leader>dl";
      action = "<cmd> DapLoadLaunchJSON<CR>";
      options.silent = true;
      mode = ["n"];
    }
    {
      key = "<leader>db";
      action = "<cmd> DapToggleBreakpoint<CR>";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      key = "<C-k>";
      action.__raw = "require('dapui').eval";
      options.silent = true;
      mode = ["v"];
    }
  ];
}
