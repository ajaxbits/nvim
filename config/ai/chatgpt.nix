{
  # Note that this requires $OPENAI_API_KEY to be set, otherwise it won't work.
  plugins.chatgpt = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "ChatGPT"
        "ChatGPTActAs"
        "ChatGPTEditWithInstructions"
        "ChatGPTRun"
      ];
      keys = [
        "<leader>ac"
        "<leader>ad"
        "<leader>ae"
        "<leader>ag"
        "<leader>ak"
        "<leader>al"
        "<leader>ao"
        "<leader>ap"
        "<leader>as"
        "<leader>at"
        "<leader>ax"
      ];
    };
    settings = rec {
      openai_params = {
        model = "gpt-4o-mini";
        max_tokens = 4095;
      };
      openai_edit_params = {
        inherit (openai_params) model;
      };
    };
  };
  extraConfigLua = builtins.readFile ./chatgpt.lua;
}
