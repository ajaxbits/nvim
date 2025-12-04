{
  plugins =
    let
      mkTextPlugin =
        extraConfig:
        {
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
        }
        // extraConfig; # The '//' operator merges the sets
    in
    {
      zen-mode = mkTextPlugin { };
      wrapping = mkTextPlugin {
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
  ];
}
