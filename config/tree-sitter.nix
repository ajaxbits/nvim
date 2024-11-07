{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
        };
        indent.enable = true;
      };
    };
    treesitter-textobjects.enable = true;
    treesitter-context = {
      enable = true;
      settings.max_lines = 4;
    };
  };
}
