{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.git;
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
    settings = {
      auto-optimise-store = true;
      max-jobs = "auto";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];
      extra-substituters = [ "https://yazi.cachix.org" ];
      extra-trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
    };
  };
}
