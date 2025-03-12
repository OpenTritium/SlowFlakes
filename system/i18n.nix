{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-pinyin-zhwiki
          fcitx5-pinyin-moegirl
          fcitx5-gtk
          libsForQt5.fcitx5-chinese-addons
          catppuccin-fcitx5
        ];
      };
    };
  };
}
