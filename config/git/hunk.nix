{ pkgs, ... }:
{
  config.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hunk.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "julienvincent";
        repo = "hunk.nvim";
        rev = "0834cb91c9eb1f315fbf49ad4ea9abc9ac8b5157";
        hash = "sha256-wtR2mPPmBK99loE1pOKqrRY8mHrTT5WsO8085wOuPuM=";
      };
    })
  ];
}
