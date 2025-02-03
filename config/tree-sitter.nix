{
  plugins = {
    treesitter = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
          disable = # Lua
            ''
              function(lang, bufnr)
                return vim.api.nvim_buf_line_count(bufnr) > 10000
              end
            '';
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
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    ts-context-commentstring.enable = true;
  };
}
