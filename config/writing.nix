{
  globals.markdown_fenced_languages = [ ];
  plugins = {
    zen-mode = {
      enable = true;
      lazyLoad.settings.cmd = "ZenMode";
    };
    wrapping = {
      enable = true;
      lazyLoad.settings.ft = [
        "asciidoc"
        "gitcommit"
        "help"
        "latex"
        "mail"
        "markdown"
        "rst"
        "tex"
        "text"
        "typst"
      ];
      settings = {
        create_keymaps = false;
        notify_on_switch = false;
        softener.markdown = true;
      };
    };
  };
  keymaps = [
    {
      options.desc = "Toggle writing mode";
      action = "<cmd>ZenMode<cr>";
      key = "<leader>w";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      options.desc = "Toggle spell check";
      action = "<cmd>setlocal spell!<cr>";
      key = "<leader>ws";
      options.silent = true;
      mode = [ "n" ];
    }
    {
      options.desc = "Toggle markdown render";
      action = "<cmd>RenderMarkdown toggle<cr>";
      key = "<leader>wm";
      options.silent = true;
      mode = [ "n" ];
    }
  ];
}
