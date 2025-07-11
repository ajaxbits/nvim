{
  extraConfigLua = builtins.readFile ./keys.lua;
  keymaps = [
    {
      key = "<TAB>";
      action = "<cmd>bnext<CR>";
      options.desc = "Next buffer (default)";
      mode = [ "n" ];
    }
    {
      key = "<S-TAB>";
      action = "<cmd>bprevious<CR>";
      options.desc = "Previous buffer";
      mode = [ "n" ];
    }
    {
      key = "|";
      action = "<Cmd>vsplit<CR>";
      options.desc = "Vertical split";
      mode = [ "n" ];
    }
    {
      key = "-";
      action = "<Cmd>split<CR>";
      options.desc = "Horizontal split";
      mode = [ "n" ];
    }
    {
      # buffer back and forth
      key = "<C-c>";
      action = "<cmd>b#<CR>";
      mode = [ "n" ];
    }
    {
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      mode = [ "v" ];
      options.silent = true;
    }
    {
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      mode = [ "v" ];
      options.silent = true;
    }
    {
      key = "J";
      action = "mzJ`z";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      key = "n";
      action = "nzzzv";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = [ "n" ];
      options.silent = true;
    }
  ];
}
