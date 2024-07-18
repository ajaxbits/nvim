{
  config = {
    keymaps = [
      {
        options.desc = "Open file browser";
        key = "<leader>pv";
        action.__raw = "vim.cmd.Ex";
        mode = ["n" "v"];
        options.silent = true;
      }
      {
        options.desc = "Rename LSP symbol under cursor";
        key = "cd";
        action.__raw = "vim.lsp.buf.rename";
        mode = ["n" "v"];
        options.silent = true;
      }
      {
        options.desc = "Rename all instances of word under cursor within buffer";
        key = "<leader>s";
        action = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
        mode = ["n" "v"];
        options.silent = true;
      }
      {
        key = "J";
        action = "mzJ`z";
        mode = ["n"];
        options.silent = true;
      }
      {
        key = "<C-d>";
        action = "<C-d>zz";
        mode = ["n"];
        options.silent = true;
      }
      {
        key = "<C-u>";
        action = "<C-u>zz";
        mode = ["n"];
        options.silent = true;
      }
      {
        key = "n";
        action = "nzz";
        mode = ["n"];
        options.silent = true;
      }
      {
        key = "N";
        action = "Nzz";
        mode = ["n"];
        options.silent = true;
      }
      {
        options.desc = "Paste over without clobbering clipboard.";
        key = "<leader>p";
        action = ''[["_dP]]'';
        mode = ["x"];
        options.silent = true;
      }
      {
        options.desc = "Yank selection or motion into the system clipboard.";
        key = "<leader>p";
        action = ''[["+y]]'';
        mode = ["n" "v"];
        options.silent = true;
      }
      {
        options.desc = "Yank current line into the system clipboard.";
        key = "<leader>p";
        action = ''[["+y]]'';
        mode = ["n" "v"];
        options.silent = true;
      }
      {
        options.desc = "Delete selection or motion without clobbering clipboard.";
        key = "<leader>d";
        action = ''[["_d]]'';
        mode = ["n" "v"];
        options.silent = true;
      }
    ];

    keymapsOnEvents = {
      InsertEnter = [
        {
          action = {
            __raw = "require(\"cmp\").mapping.confirm()";
          };
          key = "<C-y>";
        }
        {
          action = {
            __raw = "require(\"cmp\").mapping.select_next_item()";
          };
          key = "<C-n>";
        }
      ];
    };
  };
}
