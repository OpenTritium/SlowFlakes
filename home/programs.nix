{ pkgs, user, ... }:
{
  programs = {
    bash.initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    mpv.enable = true;
    yazi.enable = true;
    zed-editor = {
      enable = true;
      extensions = [ "nix" ];
      userSettings = {
        lsp = {
          rust-analyzer = {
            binary = {
              path = "/etc/profiles/per-user/${user}/bin/rust-analyzer";
            };
          };
        };
      };
    };
    hyprpanel = {
      enable = true;
      hyprland.enable = true;
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "dashboard"
              "windowtitle"
              "workspaces"
            ];
            middle = [ "clock" ];
            right = [
              "network"
              "battery"
              "volume"
              "systray"
              "notifications"
            ];
          };
        };
      };
      settings = {
        scalingPriority = "hyprland";
        bar = {
          launcher.autoDetectIcon = true;
          workspaces.show_icons = true;
        };
        menus.clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather.enabled = false;
        };
        menus.dashboard = {
          shortcuts.enabled = true;
          directories.enabled = false;
          stats.enable_gpu = true;
        };
        theme = {
          bar.transparent = true;
          font = {
            name = "SFProDisplay Nerd Font";
            size = "16px";
          };
        };
      };
    };
    fish.enable = true;
    wofi.enable = true;
    helix.enable = true;
    kitty.enable = true;
    git = {
      enable = true;
      userName = "OpenTritium";
      userEmail = "tritium404@hotmail.com";
    };
    gh.enable = true;
    vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          github.copilot-chat
          jnoortheen.nix-ide
          ms-python.python
        ];
        userSettings = {
          "editor.formatOnSave" = true;
          "editor.formatOnPaste" = true;
          "editor.formatOnType" = true;
          "editor.tabSize" = 2;
          "editor.wordWrap" = "on";
          "editor.wordWrapColumn" = 80;
          "editor.wordWrapMinified" = true;
          "editor.wordWrapUseTab" = true;
          "editor.rulers" = [ 80 ];
          "editor.renderControlCharacters" = true;
          "editor.renderLineHighlight" = "all";
          "editor.renderLineHighlightBackground" = "#000000";
          "editor.renderLineHighlightOnlyWhenFocus" = true;
          "editor.renderValidationDecorations" = "on";
          "editor.renderIndentGuides" = true;
          "editor.renderWhitespace" = "all";
        };
      };
    };
    firefox.enable = true;
    home-manager.enable = true;
  };
}
