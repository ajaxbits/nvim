{ pkgs, lib, ... }:
let
  inherit (pkgs) vimUtils fetchFromGitHub;
  inherit (pkgs.lib) getExe;
in
{
  extraPlugins = [
    (vimUtils.buildVimPlugin {
      name = "haunt";
      doCheck = false;
      src = fetchFromGitHub {
        owner = "TheNoeTrevino";
        repo = "haunt.nvim";
        rev = "815141d7367c9d895e902db27e2d25d4652ad0fc";
        hash = "sha256-2miX/k+ZdjThtwoY63mcKKXHSwjH624N7acJtiZuPjw=";
      };
    })
  ];

  extraConfigLua = ''
    require("haunt").setup({})
  '';

  keymaps = [
    # annotations
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = ''function() require("haunt.api").annotate() end'';
      options.desc = "Annotate";
    }
    {
      mode = "n";
      key = "<leader>ht";
      action.__raw = ''function() require("haunt.api").toggle_annotation() end'';
      options.desc = "Toggle annotation";
    }
    {
      mode = "n";
      key = "<leader>hT";
      action.__raw = ''function() require("haunt.api").toggle_all_lines() end'';
      options.desc = "Toggle all annotations";
    }
    {
      mode = "n";
      key = "<leader>hd";
      action.__raw = ''function() require("haunt.api").delete() end'';
      options.desc = "Delete bookmark";
    }
    {
      mode = "n";
      key = "<leader>hC";
      action.__raw = ''function() require("haunt.api").clear_all() end'';
      options.desc = "Delete all bookmarks";
    }
    # move
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = ''function() require("haunt.api").prev() end'';
      options.desc = "Previous bookmark";
    }
    {
      mode = "n";
      key = "<leader>hn";
      action.__raw = ''function() require("haunt.api").next() end'';
      options.desc = "Next bookmark";
    }
    # picker
    {
      mode = "n";
      key = "<leader>hl";
      action.__raw = ''function() require("haunt.picker").show() end'';
      options.desc = "Show Picker";
    }
    # quickfix
    {
      mode = "n";
      key = "<leader>hq";
      action.__raw = ''function() require("haunt.api").to_quickfix() end'';
      options.desc = "Send bookmarks to quickfix (buffer)";
    }
    {
      mode = "n";
      key = "<leader>hQ";
      action.__raw = ''function() require("haunt.api").to_quickfix({ current_buffer = true }) end'';
      options.desc = "Send bookmarks to quickfix (all)";
    }
    # yank
    {
      mode = "n";
      key = "<leader>hy";
      action.__raw = ''function() require("haunt.api").yank_locations({ current_buffer = true }) end'';
      options.desc = "Yank bookmark locations (buffer)";
    }
    {
      mode = "n";
      key = "<leader>hY";
      action.__raw = ''function() require("haunt.api").yank_locations() end'';
      options.desc = "Yank bookmark locations (all)";
    }
  ];
}
