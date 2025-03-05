{ pkgs, ... }:
{
  environment = {
    variables.EDITOR = "nvim";
    systemPackages = with pkgs; [
      neovim
      wget
      curl
      git
    ];
  };
}
