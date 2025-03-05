{
  pkgs,
  lib,
  user,
  stateVersion,
  ...
}:
{
  home = {
    username = user;
    homeDirectory = lib.mkDefault "/home/${user}";
    packages = with pkgs; [
      android-studio
      btop
      nixfmt-rfc-style
      jetbrains.idea-ultimate
      wpsoffice-cn
      clash-nyanpasu
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
    ];
    inherit stateVersion;
  };
  imports = [
    ./hyprland.nix
    ./programs.nix
    ./stylix.nix
  ];
}
