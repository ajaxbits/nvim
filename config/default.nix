{
  imports = [
    ./ai
    ./buffers.nix
    ./completion.nix
    ./dap.nix
    ./diagnostics.nix
    ./formatting.nix
    ./git
    ./keys.nix
    ./languages/astro
    ./languages/bash
    ./languages/css
    ./languages/html
    ./languages/python
    ./languages/rust
    ./languages/scheme
    ./languages/sql
    ./languages/terraform
    ./languages/toml
    ./languages/typescript
    ./lsp.nix
    ./navigation.nix
    ./nonels.nix
    ./refactoring.nix
    ./tasks.nix
    ./telescope.nix
    ./testing.nix
    ./tree-sitter.nix
    ./undotree.nix
    ./writing.nix
  ];

  config = {
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    luaLoader.enable = true;

    enableMan = false;
    viAlias = true;
    vimAlias = true;

    colorscheme = "gruvbox";
    colorschemes.gruvbox = {
      enable = true;
      lazyLoad.enable = true;
    };

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
      spelllang = "en_us";
      splitbelow = true;
      splitright = true;
      swapfile = false;
      tabstop = 4;
      undofile = true;
      updatetime = 50;
      visualbell = false;
      writebackup = false;
    };

    globals = {
      # enable space as leader
      mapleader = " ";
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

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
      {
        action = "<Plug>(leap)";
        key = "s";
        options.silent = true;
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        action = "<Plug>(leap-from-window)";
        key = "S";
        options.silent = true;
        mode = [ "n" ];
      }
    ];

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        pattern = [ "*" ];
        callback.__raw = "function() vim.highlight.on_yank({higroup = 'IncSearch', timeout = 40,}) end";
      }
      {
        event = [ "FileType" ];
        pattern = [ "*" ];
        callback.__raw = ''
          function()
              local spell_filetypes = {"markdown", "jj", "md"}
              local ts_lang = vim.treesitter.language.get_lang(vim.bo.filetype)
              if vim.tbl_contains(spell_filetypes, ts_lang) then
                vim.opt_local.spell = true
              end
            end
        '';
      }
    ];

    plugins = {
      lz-n.enable = true;
      auto-save.enable = true;
      auto-save.settings = {
        condition = # lua
          ''
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
      cutlass-nvim = {
        enable = true;
        settings.exclude = [
          "nd"
          "nD"
          "vd"
          "vD"
        ];
      };
      leap = {
        enable = true;
        luaConfig.post = # lua
          ''
            -- Highly recommended: define a preview filter to reduce visual noise
            -- and the blinking effect after the first keypress
            -- (`:h leap.opts.preview`). You can still target any visible
            -- positions if needed, but you can define what is considered an
            -- exceptional case.
            -- Exclude whitespace and the middle of alphabetic words from preview:
            --   foobar[baaz] = quux
            --   ^----^^^--^^-^-^--^
            require('leap').opts.preview = function (ch0, ch1, ch2)
              return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
              )
            end

            -- Define equivalence classes for brackets and quotes, in addition to
            -- the default whitespace group:
            require('leap').opts.equivalence_classes = {
              ' \t\r\n', '([{', ')]}', '\'"`'
            }
          '';
      };
      rainbow-delimiters.enable = true;
      faster.enable = true;
      yanky.enable = true;
      nvim-autopairs = {
        enable = true;
        settings.disable_filetype = [
          "scheme" # handled by parinfer
        ];
      };
      indent-blankline.enable = true;
      oil = {
        enable = true;
        settings = {
          view_options.show_hidden = true;
          keymaps = {
            "_" = "actions.open_cwd";
            "`" = "actions.cd";
            "<C-s>" = "actions.select_vsplit";
            "<CR>" = "actions.select";
            "~" = "actions.tcd";
            "g?" = "actions.show_help";
            "g\\" = "actions.toggle_trash";
            "gs" = "actions.change_sort";
            "gx" = "actions.open_external";
          };
        };
      };
      vim-surround.enable = true;
      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
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

          icons = { };

          statusline.use_icons = true;

          tabline = { };

          trailspace = { };
        };
      };
      wilder = {
        enable = true;
        settings.modes = [
          "/"
          "?"
          ":"
        ];
        renderer = # lua
          ''
            wilder.wildmenu_renderer({
              highlighter = wilder.basic_highlighter(),
            })
          '';
      };
    };
  };
}
