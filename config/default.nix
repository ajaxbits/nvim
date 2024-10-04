{ lib, ... }:
{
  imports = [
    ./ai
    ./completion.nix
    ./dap.nix
    ./git
    ./keys.nix
    ./languages/toml
    ./languages/scheme
    ./languages/terraform
    ./languages/python
    ./lsp.nix
    ./nonels.nix
    ./telescope.nix
    ./testing.nix
    ./tree-sitter.nix
    ./undotree.nix
  ];

  config = {
    enableMan = false;
    viAlias = true;
    vimAlias = true;

    colorschemes.gruvbox.enable = true;

    opts = rec {
      autoindent = true;
      encoding = "utf-8";
      errorbells = false;
      expandtab = true;
      hidden = true;
      ignorecase = true;
      incsearch = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      scrolloff = 8;
      shiftwidth = tabstop;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      softtabstop = tabstop;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      tabstop = 4;
      undofile = true;
      updatetime = 50;
      visualbell = false;
      writebackup = false;
    };

    # enable space as leader
    globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>nohl<CR><esc>";
        key = "<esc>";
        options.silent = true;
        mode = [ "n" ];
      }
      {
        action = "<nop>";
        key = "<space>";
        options.silent = true;
        mode = [ "n" ];
      }
    ];

    # globals = {
    #   netrw_browse_split = 0;
    #   netrw_banner = 0;
    #   netrw_winsize = 25;
    # };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        pattern = [ "*" ];
        callback.__raw = "function() vim.highlight.on_yank({higroup = 'IncSearch', timeout = 40,}) end";
      }
    ];

    performance.byteCompileLua.enable = true;

    plugins = {
      auto-save.enable = true;
      auto-save.settings = {
        condition = ''
          function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")
            if utils.not_in(fn.getbufvar(buf, "&filetype"), {'oil'}) then
              return true
            end
            return false
          end
        '';
        write_all_buffers = true;
      };
      comment.enable = true;
      leap.enable = true;
      rainbow-delimiters.enable = true;
      nvim-autopairs = {
        enable = true;
        settings.disable_filetype = [
          "scheme" # handled by parinfer
        ];
      };
      indent-blankline.enable = true;
      oil = {
        enable = true;
        settings.view_options.show_hidden = true;
      };
      surround.enable = true;
      mini = {
        enable = true;
        modules = {
          animate =
            let
              transitionTimeMs = 100;
              enabledTransitions = [
                "scroll"
              ];
            in
            lib.genAttrs enabledTransitions (_: {
              timing.__raw = "require('mini.animate').gen_timing.linear({ duration = ${builtins.toString transitionTimeMs}, unit = 'total' })";
            });
          clue = {
            triggers =
              let
                mkTrigger = mode: keys: { inherit mode keys; }; # nixfmt makes this bad normally
              in
              [
                (mkTrigger "n" "<Leader>")
                (mkTrigger "x" "<Leader>")
                (mkTrigger "i" "<C-x>")
                (mkTrigger "n" "g")
                (mkTrigger "x" "g")
                (mkTrigger "n" "\"")
                (mkTrigger "n" "`")
                (mkTrigger "x" "\"")
                (mkTrigger "x" "`")
                (mkTrigger "n" "\"")
                (mkTrigger "x" "\"")
                (mkTrigger "i" "<C-r>")
                (mkTrigger "c" "<C-r>")
                (mkTrigger "n" "<C-w>")
                (mkTrigger "n" "z")
                (mkTrigger "x" "z")
              ];

            clues = [
              { __raw = "require('mini.clue').gen_clues.builtin_completion()"; }
              { __raw = "require('mini.clue').gen_clues.g()"; }
              { __raw = "require('mini.clue').gen_clues.marks()"; }
              { __raw = "require('mini.clue').gen_clues.registers()"; }
              { __raw = "require('mini.clue').gen_clues.windows()"; }
              { __raw = "require('mini.clue').gen_clues.z()"; }
            ];
          };

          statusline.use_icons = true;
        };
      };
      wilder = {
        enable = true;
        modes = [
          "/"
          "?"
          ":"
        ];
        renderer = ''
          wilder.wildmenu_renderer({
            highlighter = wilder.basic_highlighter(),
          })
        '';
      };
    };
  };
}
