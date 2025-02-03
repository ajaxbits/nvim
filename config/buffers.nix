{
  plugins = {
    snacks = {
      enable = true;
      settings = {
        bufdelete.enabled = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-w>";
      action.__raw = ''
        function()
            return Snacks.bufdelete.delete()
        end
      '';
      options = {
        desc = "Close buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bc";
      action.__raw = ''
        function()
            Snacks.bufdelete.other()
        end
      '';
      options = {
        desc = "Close all buffers but current";
      };
    }
    {
      mode = "n";
      key = "<leader>bC";
      action.__raw = ''
        function()
            Snacks.bufdelete.all()
        end
      '';
      options = {
        desc = "Close all buffers";
      };
    }
  ];
}
