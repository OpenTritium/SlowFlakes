{
  platform,
  inputs,
  lib,
  ...
}:
{
  nixpkgs = {
    hostPlatform = platform;
    config = {
      joypixels.acceptLicense = true;
      allowUnfree = lib.mkForce true;
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
      inputs.nur.overlays.default
      inputs.hypr-polkit-agent.overlays.default
      (self: super: {
        wpsoffice-cn = super.wpsoffice.overrideAttrs (oldAttrs: {
          # 添加 makeWrapper 作为构建依赖
          nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ super.makeWrapper ];

          # 在安装阶段后添加环境变量包装
          postInstall =
            (oldAttrs.postInstall or "")
            + ''
              for bin in wps wpp et wpspdf; do
                target="$out/bin/$bin"
                if [ -f "$target" ]; then
                  wrapProgram "$target" \
                    --set QT_FONT_DPI 192 
                fi
              done
            '';
        });
      })

    ];
  };
}
