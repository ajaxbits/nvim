{
  plugins.undotree = {
    enable = true;
  };

  keymaps = [
    {
      options.desc = "Toggle undotree";
      action.__raw = "vim.cmd.UndotreeToggle";
      key = "<leader>u";
      options.silent = true;
      mode = [ "n" ];
    }
  ];
}
