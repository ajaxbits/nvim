{
  config = {
    plugins.nvim-ufo = {
      enable = true;
    };

    options = {
      foldcolumn = "1";
      fillchars = {
        eob = " ";
        fold = " ";
        foldopen = "";
        foldsep = " ";
        foldclose = "";
      };
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
  };
}
