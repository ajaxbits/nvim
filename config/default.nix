{
  imports = [
    ./ai
    ./completion.nix
    ./dap.nix
    ./folding
    ./git
    ./keys.nix
    ./languages/toml
    ./languages/scheme
    ./languages/terraform
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

    globals = {
      netrw_browse_split = 0;
      netrw_banner = 0;
      netrw_winsize = 25;
    };

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
      surround.enable = true;
      which-key.enable = true;
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
