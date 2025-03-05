{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      serif = {
        package = pkgs.source-han-serif;
        name = "Source Han Serif SC";
      };

      sansSerif = {
        package = pkgs.source-han-sans;
        name = "Source Han Sans SC";
      };

      monospace = {
        package = pkgs.maple-mono-SC-NF;
        name = "Maple Mono SC NF";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
