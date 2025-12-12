{
  plugins = {
    # TODO: it looks like the dap API changed. None of my commands work anymore. gotta use lua. Look into lazy loading while you're at it.
    dap = {
      enable = true;
      luaConfig.pre =
        # Lua
        ''
          require("dap").listeners.before.attach.dapui_config = function()
            require("dapui").open()
          end
          require("dap").listeners.before.launch.dapui_config = function()
            require("dapui").open()
          end
          require("dap").listeners.before.event_terminated.dapui_config = function()
            require("dapui").close()
          end
          require("dap").listeners.before.event_exited.dapui_config = function()
            require("dapui").close()
          end
        '';
    };
    dap-python = {
      enable = true;
      testRunner = "pytest";
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
        before.__raw = ''
          function()
            require('lz.n').trigger_load('nvim-dap', {})
            require('lz.n').trigger_load('nvim-dap-virtual-text', {})
            require("dap").listeners.before.attach.dapui_config = function()
              require("dapui").open()
            end
            require("dap").listeners.before.launch.dapui_config = function()
              require("dapui").open()
            end
          end
        '';
        keys = [
          {
            __unkeyed-1 = "<leader>dt";
            __unkeyed-2.__raw = ''
              function()
                require("dapui").toggle()
              end
            '';
            desc = "Toggle Debugger UI";
          }
        ];
      };
    };
    dap-virtual-text = {
      enable = true;
      lazyLoad.settings = {
        before.__raw = ''
          function()
            require('lz.n').trigger_load('nvim-dap')
          end
        '';
        cmd = [
          "DapVirtualTextEnable"
          "DapVirtualTextForceRefresh"
          "DapVirtualTextToggle"
        ];
      };
    };
  };

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
  ];
}
