{
  plugins = {
    overseer = {
      enable = true;
      lazyLoad.settings.before.__raw = ''
        function()
          require "lz.n".trigger_load "snacks.nvim"
        end
      '';
      lazyLoad.settings.keys = [
        {
          __unkeyed-1 = "<leader>ro";
          __unkeyed-2 = "<cmd>OverseerToggle<cr>";
        }
        {
          __unkeyed-1 = "<leader>rr";
          __unkeyed-2 = "<cmd>OverseerRun<cr>";
        }
      ];
    };
  };
}
