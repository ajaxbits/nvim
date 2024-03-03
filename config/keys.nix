{
  lib,
  config,
  ...
}: {
  config = {
    keymaps =
      [
        {
          key = "<Tab>";
          action = "<cmd>bnext<CR>";
          mode = ["n"];
          options.silent = true;
        }
        {
          key = "<S-Tab>";
          action = "<cmd>bprev<CR>";
          mode = ["n"];
          options.silent = true;
        }
        {
          options.desc = "Rename symbol under cursor";
          key = "grr";
          action = "<cmd>lua vim.lsp.buf.rename()<cr>";
          mode = ["n" "v"];
          options.silent = true;
        }
      ]
      ++ lib.optionals config.plugins.spider.enable [
        {
          mode = ["n" "o" "x"];
          key = "w";
          action = "<cmd>lua require('spider').motion('w')<CR>";
          options.desc = "Spider-w";
          options.silent = true;
        }
        {
          mode = ["n" "o" "x"];
          key = "e";
          action = "<cmd>lua require('spider').motion('e')<CR>";
          options.desc = "Spider-e";
          options.silent = true;
        }
        {
          mode = ["n" "o" "x"];
          key = "b";
          action = "<cmd>lua require('spider').motion('b')<CR>";
          options.desc = "Spider-b";
          options.silent = true;
        }
      ];
  };
}
