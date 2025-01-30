{ pkgs, lib, ... }:
{
  # TODO: revisit once lazy loading is a thing
  plugins = {
    conjure.enable = false;
    parinfer-rust.enable = false;
  };
  #
  # extraConfigLua = builtins.readFile (
  #   pkgs.substituteAll {
  #     name = "conjure.lua";
  #     src = ./conjure.lua;
  #
  #     csi = lib.getExe' pkgs.chicken "chicken";
  #   }
  # );
}
