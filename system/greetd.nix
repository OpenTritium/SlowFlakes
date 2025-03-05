{
  lib,
  config,
  user,
  ...
}:
let
  session = {
    inherit user;
    command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
  };
in
{
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };
}
