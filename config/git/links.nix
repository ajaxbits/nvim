{ pkgs, lib, ... }:
{
  config = {
    plugins.gitlinker.enable = true;
    keymaps =
      let
        gitPrefix = "<leader>g";
        openPrefix = "${gitPrefix}o";
      in
      [
        {
          options.desc = "Open repo in browser.";
          action = "<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').open_in_browser})<cr>";
          key = "${openPrefix}r";
          options.silent = true;
          mode = [ "n" ];
        }
        {
          options.desc = "Open pr on GitHub.";
          action = "<cmd>! ${lib.getExe pkgs.gh} pr view -w<cr>";
          key = "${openPrefix}p";
          options.silent = true;
          mode = [ "n" ];
        }
      ];
  };
}
