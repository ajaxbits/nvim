{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neotest
    neotest-python
  ];

  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
      },
    })
  '';
  keymaps = let
    neotest = function: "<CMD>lua require('neotest').${function} <CR>";
  in [
    {
      options.desc = "Run test under cursor";
      key = "<leader>tt";
      action = neotest "run.run()";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Debug test under cursor";
      key = "<leader>td";
      action = neotest "run.run({strategy='dap'})";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Run all tests in file";
      key = "<leader>tf";
      action = neotest "run.run(vim.fn.expand('%'))";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Run all discovered tests";
      key = "<leader>ta";
      action = neotest "run.run({suite=true})";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Rerun last test";
      key = "<leader>tr";
      action = neotest "run.run_last()";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Stop running test";
      key = "<leader>ts";
      action = neotest "run.stop()";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Toggle test output panel";
      key = "<leader>too";
      action = neotest "output_panel.toggle()";
      options.silent = true;
      mode = ["n" "v"];
    }
    {
      options.desc = "Toggle test summary panel";
      key = "<leader>tos";
      action = neotest "summary.toggle()";
      options.silent = true;
      mode = ["n" "v"];
    }
  ];
}
