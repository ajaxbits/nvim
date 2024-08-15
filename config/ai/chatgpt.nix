{
  # Note that this requires $OPENAI_API_KEY to be set, otherwise it won't work. 
  plugins.chatgpt = {
    enable = true;
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
