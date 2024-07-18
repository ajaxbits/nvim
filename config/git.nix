{pkgs, ...}: {
  config = {
    plugins = {
      gitsigns = {
        enable = true;
        settings.diff_opts.internal = true;
      };
      gitlinker.enable = true;
    };

    keymaps = let
      gitPrefix = "<leader>g";
      openPrefix = "${gitPrefix}o";
    in [
      {
        options.desc = "Reset hunk";
        action = "<cmd>Gitsigns reset_hunk<cr>";
        key = "${gitPrefix}r";
        options.silent = true;
        mode = ["n" "v"];
      }
      {
        options.desc = "Show line blame";
        action = "<cmd>Gitsigns blame_line<cr>";
        key = "${gitPrefix}b";
        options.silent = true;
        mode = ["n"];
      }
      {
        options.desc = "Open repo in browser.";
        action = "<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').open_in_browser})<cr>";
        key = "${openPrefix}r";
        options.silent = true;
        mode = ["n"];
      }
      {
        options.desc = "Open pr on GitHub.";
        action = "<cmd>! ${pkgs.gh}/bin/gh pr view -w<cr>";
        key = "${openPrefix}p";
        options.silent = true;
        mode = ["n"];
      }
    ];
  };
}
