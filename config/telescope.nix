{
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.cmd = "Telescope";
    keymaps = {
      "<C-p>" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
      "<leader>lf" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>ls" = {
        action = "live_grep";
        options.desc = "Grep files";
      };
    };
  };
}
