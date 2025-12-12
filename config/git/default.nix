{
  imports = [
    ./links.nix
  ];

  config = {
    plugins = {
      gitsigns = {
        enable = true;
        settings.diff_opts.internal = true;
      };
    };

    keymaps =
      let
        gitPrefix = "<leader>g";
      in
      [
        {
          options.desc = "Reset hunk";
          action = "<cmd>Gitsigns reset_hunk<cr>";
          key = "${gitPrefix}r";
          options.silent = true;
          mode = [
            "n"
            "v"
          ];
        }
        {
          options.desc = "Show line blame";
          action = "<cmd>Gitsigns blame_line<cr>";
          key = "${gitPrefix}b";
          options.silent = true;
          mode = [ "n" ];
        }
      ];
  };
}
