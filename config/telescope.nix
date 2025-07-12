{ pkgs, lib, ... }:
let
  fd = lib.getExe pkgs.fd;
  rg = lib.getExe pkgs.ripgrep;
in
{
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.cmd = "Telescope";
    keymaps = {
      "<C-p>" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
      "<leader>of" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>os" = {
        action = "live_grep";
        options.desc = "Grep files";
      };
      "<leader>ob" = {
        action = "buffers";
        options.desc = "Open buffers";
      };
    };
    settings =
      let
        excludes = [
          "__pycache__"
          ".cargo"
          ".direnv"
          ".git"
          ".jj"
          ".tox"
          ".venv"
          "node_modules"
        ];
        grepExcludes = [
          "*.lock"
          "**/package-lock.json"
        ];
      in
      {
        defaults = {
          vimgrep_arguments =
            [
              rg
              "--color=never"
              "--column"
              "--hidden"
              "--line-number"
              "--no-heading"
              "--smart-case"
              "--with-filename"
            ]
            ++ (lib.concatLists (
              map (pattern: [
                "--glob"
                "!${pattern}/*"
              ]) excludes
            ))
            ++ (lib.concatLists (
              map (pattern: [
                "--glob"
                "!${pattern}"
              ]) grepExcludes
            ));
        };
        pickers.find_files.find_command =
          [
            fd
            "--unrestricted"
            "--ignore-case"
            "--type"
            "f"
          ]
          ++ (lib.concatLists (
            map (pattern: [
              "--exclude"
              pattern
            ]) excludes
          ));
      };
  };
}
