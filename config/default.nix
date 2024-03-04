{
  imports = [
    ./ui.nix
    ./keys.nix
    ./lsp.nix
    ./completion.nix
    ./dap.nix
    ./tree-sitter.nix
    ./testing.nix
    ./folding.nix
    ./nonels.nix
    ./training.nix
  ];

  config = {
    enableMan = false;
    viAlias = true;
    vimAlias = true;

    clipboard.register = "unnamedplus";
    colorschemes.gruvbox.enable = true;

    options = {
      encoding = "utf-8";
      expandtab = true;
      ignorecase = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      writebackup = false;
      swapfile = false;
      relativenumber = true;
      number = true;
      mouse = "a";
      smartindent = true;
      undofile = true;
    };

    globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>nohl<CR><esc>";
        key = "<esc>";
        options.silent = true;
        mode = ["n"];
      }
      {
        action = "<nop>";
        key = "<space>";
        options.silent = true;
        mode = ["n"];
      }
    ];

    plugins = {
      auto-save.enable = true;
      auto-session = {
        enable = true;
        autoSave.enabled = true;
        autoRestore.enabled = true;
        autoSession.enableLastSession = true;
      };
      gitlinker.enable = true;
      comment-nvim.enable = true;
      leap.enable = true;
      spider.enable = true;
      rainbow-delimiters.enable = true;
      gitsigns.enable = true;
      lastplace.enable = true;
      nvim-autopairs.enable = true;
      todo-comments.enable = true;
      indent-blankline.enable = true;
      surround.enable = true;
      which-key.enable = true;
      wilder = {
        enable = true;
        modes = ["/" "?" ":"];
        renderer = ''
          wilder.wildmenu_renderer({
            highlighter = wilder.basic_highlighter(),
          })
        '';
      };
    };
  };
}
