{
  plugins = {
    coq-nvim = {
      enable = true;
    };
    copilot-vim = {
      enable = true;
      filetypes = {
        "*" = true;
        "markdown" = false;
      };
    };
  };
}
