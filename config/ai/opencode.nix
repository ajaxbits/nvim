{
  plugins.opencode = {
    enable = true;
    lazyLoad.settings.keys =
      let
        opencode =
          method: # lua
          ''
            function()
              require('opencode').${method}
            end
          '';
      in
      [
        {
          __unkeyed-1 = "<leader>aa";
          __unkeyed-2.__raw = # lua
            ''
              function()
                require('opencode').ask('@this: ', { submit = true })
              end
            '';
          mode = [
            "n"
            "x"
          ];
          desc = "Ask opencode…";
        }
        {
          __unkeyed-1 = "<leader>ax";
          __unkeyed-2.__raw = opencode "select()";
          mode = [
            "n"
            "x"
          ];
          desc = "Execute opencode action…";
        }
        {
          __unkeyed-1 = "<leader>at";
          __unkeyed-2.__raw = opencode "toggle()";
          mode = [ "n" ];
          desc = "Toggle opencode";
        }
        {
          __unkeyed-1 = "<C-.>";
          __unkeyed-2.__raw = opencode "toggle()";
          mode = [ "t" ];
          desc = "Toggle opencode";
        }
        {
          __unkeyed-1 = "go";
          __unkeyed-2.__raw = # lua
            ''
              function()
                return require('opencode').operator('@this ')
              end
            '';
          mode = [
            "n"
            "x"
          ];
          desc = "Add range to opencode";
          expr = true;
        }
        {
          __unkeyed-1 = "goo";
          __unkeyed-2.__raw = # lua
            ''
              function()
                return require('opencode').operator('@this ') .. '_'
              end
            '';
          desc = "Add line to opencode";
          expr = true;
        }
        {
          __unkeyed-1 = "<S-C-u>";
          __unkeyed-2.__raw = # lua
            ''
              function()
                require('opencode').command('session.half.page.up')
              end
            '';
          desc = "Scroll opencode up";
        }
        {
          __unkeyed-1 = "<S-C-d>";
          __unkeyed-2.__raw = # lua
            ''
              function()
                require('opencode').command('session.half.page.down')
              end
            '';
          desc = "Scroll opencode down";
        }
      ];
  };
}
