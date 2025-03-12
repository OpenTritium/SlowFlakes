{
  pkgs,
  lib,
  user,
  stateVersion,
  inputs,
  platform,
  ...
}:
{
  home = {
    username = user;
    homeDirectory = lib.mkDefault "/home/${user}";
    packages = with pkgs; [
      android-studio-full
      btop
      nixfmt-rfc-style
      jetbrains.idea-ultimate
      jdk
      qq
      fastfetch
      grimblast
      ungoogled-chromium
      distrobox
      unrar
      hyprpolkitagent
      rustup
      nixd
      wpsoffice-cn
      inputs.wpsFonts.packages.${platform}.default
      qbittorrent-enhanced
      inputs.windows-fonts.packages.${platform}.win11Fonts
      parsec-bin
    ];
    inherit stateVersion;
  };
  imports = [
    ./hyprland.nix
    ./programs.nix
    ./stylix.nix
  ];
}
