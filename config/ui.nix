{
  plugins = {
    bufferline = {
      enable = true;
    };
    lualine = {
      enable = true;
      extensions = ["nvim-tree"];
      theme = "gruvbox";
      globalstatus = true;
    };
    nvim-tree.enable = true;

    smart-splits.enable = true;

    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
      keymapsSilent = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-n>";
      mode = ["n"];
      options.silent = true;
    }
    {
      action = "<cmd>NvimTreeFindFile<CR>";
      key = "<leader>tg";
      mode = ["n"];
      options.silent = true;
    }
    {
      action = "require('smart-splits').move_cursor_left";
      key = "<C-h>";
      lua = true;
      mode = ["n"];
      options.silent = true;
    }
    {
      action = "require('smart-splits').move_cursor_right";
      key = "<C-l>";
      lua = true;
      mode = ["n"];
      options.silent = true;
    }
    {
      action = "require('smart-splits').move_cursor_up";
      key = "<C-k>";
      lua = true;
      mode = ["n"];
      options.silent = true;
    }
    {
      action = "require('smart-splits').move_cursor_down";
      key = "<C-j>";
      lua = true;
      mode = ["n"];
      options.silent = true;
    }
  ];
}
