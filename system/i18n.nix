{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-pinyin-zhwiki
          fcitx5-pinyin-moegirl
          fcitx5-gtk
          libsForQt5.fcitx5-chinese-addons
        ];
      };
    };
  };
}
