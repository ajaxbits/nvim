{
  plugins.diffview = {
    enable = true;
    luaConfig.post = builtins.readFile ./diffview.lua;
    lazyLoad.settings = {
      cmd = [
        "DiffviewOpen"
        "DiffviewClose"
        "DiffviewToggleFiles"
        "DiffviewFocusFiles"
        "DiffviewRefresh"
        "DiffviewFileHistory"
      ];
    };
  };

  # Muted, gruvbox-friendly diff backgrounds. Applied via ColorScheme autocmd
  # so they survive gruvbox loading. Foreground is left unset on add/change so
  # syntax highlighting shows through.
  highlightOverride = {
    DiffAdd = {
      bg = "#2c3a2c";
    };
    DiffChange = {
      bg = "#2c3340";
    };
    DiffText = {
      bg = "#3b4c66";
      bold = true;
    };
    DiffDelete = {
      bg = "#3a2c2c";
      fg = "#7a4a4a";
    };
  };
}
