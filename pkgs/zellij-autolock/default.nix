{
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation rec {
  pname = "zellij-autolock";
  version = "0.2.2";

  src = builtins.fetchurl {
    url = "https://github.com/fresh2dev/zellij-autolock/releases/download/${version}/zellij-autolock.wasm";
    sha256 = "sha256-aclWB7/ZfgddZ2KkT9vHA6gqPEkJ27vkOVLwIEh7jqQ=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/zellij-autolock.wasm
    chmod +x $out/bin/zellij-autolock.wasm
  '';

  meta = with lib; {
    description = "autolock Zellij when certain processes open.";
    homepage = "https://github.com/fresh2dev/zellij-autolock";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = [ maintainers.ajaxbits ];
    mainProgram = "zellij-autolock.wasm";
  };
}
