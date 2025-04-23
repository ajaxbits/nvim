{
  pkgs,
  ...
}:
let
  inherit (pkgs) nodejs typescript;
in
{
  imports = [
    ./debugging.nix
    # ./jester.nix
  ];

  extraPackages = [ nodejs ];

  plugins = {
    typescript-tools = {
      enable = true;
      lazyLoad.settings.ft = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];
      settings.settings = {
        code_lens = "off";
        complete_function_calls = false;
        disable_member_code_lens = true;
        expose_as_code_action = "all";
        include_completions_with_insert_text = true;
        jsx_close_tag = {
          enable = false;
          filetypes = [
            "javascriptreact"
            "typescriptreact"
          ];
        };
        publish_diagnostic_on = "insert_leave";
        separate_diagnostic_server = true;
        tsserver_locale = "en";
        tsserver_max_memory = "auto";
        tsserver_path = "${typescript}/lib/node_modules/typescript/lib/tsserver.js";
      };
    };
  };
}
