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
    ./languages/html
    ./languages/python
    ./languages/scheme
    ./languages/terraform
    ./languages/typescript
    ./languages/toml
    ./lsp.nix
    ./nonels.nix
    ./refactoring.nix
    ./tasks.nix
    ./telescope.nix
    ./testing.nix
    ./tree-sitter.nix
    ./undotree.nix
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

          icons = { };

          statusline.use_icons = true;

          tabline = { };

          trailspace = { };
        };
      };
      wilder = {
        enable = true;
        modes = [
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
