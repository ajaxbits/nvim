{pkgs, ...}: {
  config = {
    extraPlugins = [pkgs.vimPlugins.lazygit-nvim];

    plugins = {
      gitsigns = {
        enable = true;
        settings.diff_opts.internal = true;
      };
      gitlinker.enable = true;
      diffview = {
        enable = true;
        enhancedDiffHl = true;
      };
    };

    opts.fillchars.diff = "╱";

    keymaps = let
      gitPrefix = "<leader>g";
      openPrefix = "${gitPrefix}o";
      diffPrefix = "${gitPrefix}d";
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
      {
        options.desc = "Toggle Diffview";
        action = "<cmd>DiffviewToggle<cr>";
        key = "${diffPrefix}d";
        options.silent = true;
        mode = ["n"];
      }
      {
        options.desc = "Open file history for current file.";
        action = "<cmd>DiffviewFileHistory %<cr>";
        key = "${diffPrefix}f";
        options.silent = true;
        mode = ["n"];
      }
    ];

    highlightOverride = {
      DiffviewDiffAddAsDelete.bg = "#431313";
      DiffDelete = {
        bg = "none";
        fg = "#504945";
      };
      DiffviewDiffDelete = {
        bg = "none";
        fg = "#504945";
      };
      DiffAdd.bg = "#142a03";
      DiffChange.bg = "#3B3307";
      DiffText.bg = "#4D520D";
    };

    extraConfigLua = builtins.readFile ./git.lua;
  };
}
