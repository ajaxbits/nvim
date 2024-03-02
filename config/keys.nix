{
  keymaps = [
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
  ];
}
