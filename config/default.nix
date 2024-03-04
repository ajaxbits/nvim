{pkgs, ...}: {
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

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "neovim-project";
        src = pkgs.fetchFromGitHub {
          owner = "coffebar";
          repo = "neovim-project";
          rev = "e7868b38f402be94e859d479002df1418bc1e954";
          hash = "sha256-9bvvTBCIn1NdTfwGIBgFTgeGQw67R0xRYodlZn/zjEE=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "neovim-session-manager";
        src = pkgs.fetchFromGitHub {
          owner = "Shatur";
          repo = "neovim-session-manager";
          rev = "d8e1ba3bbcf3fdc6a887bcfbd94c48ae4707b457";
          hash = "sha256-+TDWY8mprJfUp9ZFKbz83to7XW8iiovja22jHms+N1A=";
        };
      })
    ];

    extraConfigLua = ''
      vim.opt.sessionoptions = { "globals" }
      require("neovim-project").setup {
        projects = { -- define project roots
          "~/code/*",
          "~/projects/*",
        },
      }
    '';
  };
}
