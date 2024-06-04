{pkgs, ...}: {
  plugins = {
    conjure.enable = true;
    parinfer-rust.enable = true;
  };

  extraConfigLua = builtins.readFile (pkgs.substituteAll {
    name = "conjure.lua";
    src = ./conjure.lua;

    csi = "${pkgs.chicken}/bin/csi";
  });
}
