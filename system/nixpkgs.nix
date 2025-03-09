{ platform, inputs, ... }:
{
  nixpkgs = {
    hostPlatform = platform;
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [
      (_: _: {
        hyprland = inputs.hyprland.packages.${platform}.hyprland;
      })
      (_: _: {
        swww = inputs.swww.packages.${platform}.swww;
      })
      (_: _: {
        xdg-desktop-portal-hyprland = inputs.hyprland.packages.${platform}.xdg-desktop-portal-hyprland;
      })
      inputs.hyprpanel.overlay
      inputs.yazi.overlays.default
      #inputs.zed-editor.overlays.default
      inputs.hypr-polkit-agent.overlays.default
    ];
  };
}
