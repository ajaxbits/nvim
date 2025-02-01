{
  plugins = {
    treesitter = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
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
      lazyLoad.settings.event = "BufEnter";
      settings.max_lines = 4;
    };
    ts-comments = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
    };
    ts-context-commentstring.enable = true;
  };
}
