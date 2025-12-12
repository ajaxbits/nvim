{
  plugins.avante = {
    enable = true;
    lazyLoad = {
      settings = {
        event = "DeferredUIEnter";
      };
    };
    settings = {
      provider = "copilot";
      providers.copilot = {
        model = "gemini-3-pro-preview";
      };
      behavior = {
        auto_suggestions = false;
        enable_claude_text_editor_tool_mode = true;
        enable_cursor_planning_mode = true;
      };
      hints.enabled = false;
      windows.wrap = true;
    };
  };
  plugins.render-markdown = {
    enable = true;
    lazyLoad.settings.ft = [
      "Avante"
      "markdown"
    ];
  };
}
