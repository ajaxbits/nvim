let
  mkBinding =
    {
      key,
      action,
      desc,
    }:
    {
      inherit key action;
      mode = [ "n" ];
      options = {
        inherit desc;
        noremap = true;
        silent = true;
      };
    };
in
{
  plugins.zellij-nav = {
    enable = true;
  };
  autoCmd = [
    {
      command = "silent !zellij action switch-mode normal";
      event = [ "VimLeave" ];
      pattern = [ "*" ];
    }
  ];
  keymaps = builtins.map mkBinding [
    {
      key = "<c-h>";
      action = "<cmd>ZellijNavigateLeftTab<cr>";
      desc = "navigate left or tab";
    }
    {
      key = "<c-j>";
      action = "<cmd>ZellijNavigateDown<cr>";
      desc = "navigate down";
    }
    {
      key = "<c-k>";
      action = "<cmd>ZellijNavigateUp<cr>";
      desc = "navigate up";
    }
    {
      key = "<c-l>";
      action = "<cmd>ZellijNavigateRightTab<cr>";
      desc = "navigate right or tab";
    }
  ];
}
