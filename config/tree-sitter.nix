{
  plugins = {
    treesitter.enable = true;
    treesitter-textobjects.enable = true;
    treesitter-context = {
      enable = true;
      settings.max_lines = 4;
    };
  };
}
