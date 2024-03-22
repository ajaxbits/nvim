{
  pkgs,
  lib,
  ...
}: {
  config = {
    plugins = {
      barbecue.enable = true;
      bufferline.enable = true;
      lualine = {
        enable = true;
        extensions = ["nvim-tree"];
        theme = "gruvbox";
        globalstatus = true;
      };
      neoscroll = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
        autoClose = true;
        hijackNetrw = true;
        hijackDirectories.enable = true;
        hijackUnnamedBufferWhenOpening = true;
        syncRootWithCwd = true;
        git.ignore = false;
        renderer.groupEmpty = true;
        actions.openFile.quitOnOpen = true;
        extraOptions.open_on_tab = true;
      };

      smart-splits.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
        keymapsSilent = true;
        extensions.undo.enable = true;
      };
    };

    autoCmd = [
      {
        event = "VimEnter";
        callback.__raw = ''
          function(data)
            -- buffer is a real file on the disk
            local real_file = vim.fn.filereadable(data.file) == 1

            -- buffer is a [No Name]
            local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

            if not real_file and not no_name then
              return
            end

            -- open the tree, find the file but don't focus it
            require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
          end
        '';
      }
    ];

    keymaps = let
      inherit (lib) concatStringsSep;
      excludedPaths = [
        "**/.git"
        "**/node_modules"
        "**/.venv"
        "**/.terraform"
        "**/.direnv"
        "**/result"
        "**/target"
      ];

      excludes = concatStringsSep "," (map (path: "--exclude,${path}") excludedPaths);
      searchCommand = commandBin: "find_command=${commandBin},-tf,-tl,--unrestricted,${excludes}";
    in [
      {
        options.desc = "Find files";
        action = "<cmd>Telescope find_files ${searchCommand "${pkgs.fd}/bin/fd"} prompt_prefix=📂<cr>";
        key = "<leader>ff";
        mode = ["n"];
        options.silent = true;
      }
      {
        options.desc = "Search in files";
        action = "<cmd>Telescope live_grep ${searchCommand "${pkgs.ripgrep}/bin/rg"} prompt_prefix=🔍<cr>";
        key = "<leader>fg";
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "<cmd>LazyGit<cr>";
        key = "<leader>gg";
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<C-n>";
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "<cmd>NvimTreeFindFile<CR>";
        key = "<leader>tg";
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "<cmd>Telescope undo<CR>";
        key = "<leader>fu";
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "require('smart-splits').move_cursor_left";
        key = "<C-h>";
        lua = true;
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "require('smart-splits').move_cursor_right";
        key = "<C-l>";
        lua = true;
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "require('smart-splits').move_cursor_up";
        key = "<C-k>";
        lua = true;
        mode = ["n"];
        options.silent = true;
      }
      {
        action = "require('smart-splits').move_cursor_down";
        key = "<C-j>";
        lua = true;
        mode = ["n"];
        options.silent = true;
      }
    ];
  };
}
