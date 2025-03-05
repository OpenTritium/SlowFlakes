{
  description = "OpenTritium";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/v1.11.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hypr-polkit-agent.url = "github:/hyprwm/hyprpolkitagent";
    hyprland-qt-support.url = "github:/hyprwm/hyprland-qt-support";
    hyprcursor.url = "github:/hyprwm/hyprcursor";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    swww.url = "github:LGFae/swww";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
    zed-editor.url = "github:zed-industries/zed";
  };

  outputs =
    {
      home-manager,
      hyprland,
      hyprland-plugins,
      nixpkgs,
      disko,
      stylix,
      hyprpanel,
      auto-cpufreq,
      ...
    }@inputs:
    let
      platform = "x86_64-linux";
      user = "tritium";
      host = "nixos";
      stateVersion = "24.11";
    in
    {
      nixosConfigurations = {
        ${host} = nixpkgs.lib.nixosSystem rec {
          system = platform;
          specialArgs = {
            inherit
              inputs
              platform
              user
              host
              stateVersion
              ;
          };
          modules = [
            disko.nixosModules.disko
            ./partition.nix
            ./system
            auto-cpufreq.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = specialArgs;
                backupFileExtension = "bak";
                useUserPackages = true;
                useGlobalPkgs = true;
                users.${user}.imports = [
                  ./home
                  hyprpanel.homeManagerModules.hyprpanel
                  stylix.homeManagerModules.stylix
                ];
              };
            }
          ];
        };
      };
    };
}
