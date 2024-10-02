{
  extraConfigLua = builtins.readFile ./keys.lua;
  keymaps = [
    {
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      mode = ["v"];
      options.silent = true;
    }
    {
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      mode = ["v"];
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
      action = "nzzzv";
      mode = ["n"];
      options.silent = true;
    }
    {
      key = "N";
      action = "Nzzzv";
      mode = ["n"];
      options.silent = true;
    }
  ];
}
