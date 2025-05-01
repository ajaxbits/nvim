{
  plugins.neotest = {
    enable = true;
    adapters = {
      go.enable = true;
      jest = {
        enable = true;
        settings.env.NODE_OPTIONS = "--experimental-vm-modules";
      };
      python.enable = true;
    };
  };

  plugins.neotest.lazyLoad.settings = {
    cmd = "Neotest";
    keys =
      let
        neotest =
          function: # lua
          ''
            function()
                require('neotest').${function}
            end
          '';
      in
      [
        {
          desc = "Run test under cursor";
          __unkeyed-1 = "<leader>tt";
          __unkeyed-3.__raw = neotest "run.run()";
        }
        {
          desc = "Debug test under cursor";
          __unkeyed-1 = "<leader>td";
          __unkeyed-3.__raw = neotest "run.run({strategy='dap'})";
        }
        {
          desc = "Run all tests in file";
          __unkeyed-1 = "<leader>tf";
          __unkeyed-3.__raw = neotest "run.run(vim.fn.expand('%'))";
        }
        {
          desc = "Run all discovered tests";
          __unkeyed-1 = "<leader>ta";
          __unkeyed-3.__raw = neotest "run.run({suite=true})";
        }
        {
          desc = "Rerun last test";
          __unkeyed-1 = "<leader>tr";
          __unkeyed-3.__raw = neotest "run.run_last()";
        }
        {
          desc = "Stop running test";
          __unkeyed-1 = "<leader>ts";
          __unkeyed-3.__raw = neotest "run.stop()";
        }
        {
          desc = "Toggle test output panel";
          __unkeyed-1 = "<leader>too";
          __unkeyed-3.__raw = neotest "output_panel.toggle()";
        }
        {
          desc = "Toggle test summary panel";
          __unkeyed-1 = "<leader>tos";
          __unkeyed-3.__raw = neotest "summary.toggle()";
        }
      ];
  };

}
