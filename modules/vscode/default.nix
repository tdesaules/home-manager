{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.configurations.vscode = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable VSCode";
    };
  };
  config = lib.mkIf config.configurations.vscode.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode" ];
    programs.vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          redhat.vscode-yaml
          oderwat.indent-rainbow
          jnoortheen.nix-ide
        ];
        userSettings = {
          "[nix]" = {
            editor.defaultFormatter = "jnoortheen.nix-ide";
            editor.tabSize = 2;
          };
          editor.formatOnSave = true;
          editor.guides.bracketPairs = true;
          terminal.integrated.fontFamily = "DejaVuSansM Nerd Font";
          terminal.integrated.fontSize = 14;
          terminal.integrated.profiles.linux = {
            bash = {
              path = "bash";
            };
            fish = {
              path = "fish";
            };
          };
          terminal.integrated.defaultProfile.linux = "fish";
          chat.commandCenter.enabled = false;
          chat.experimental.statusIndicator.enabled = false;
        };
        keybindings = [
          # {
          #  key = "alt+meta+enter";
          #  command = "workbench.action.toggleMaximizedPanel";
          #  when = "panelAlignment == 'center' || panelPosition != 'bottom' && panelPosition != 'top'";
          # }
        ];
      };
    };
  };
}
