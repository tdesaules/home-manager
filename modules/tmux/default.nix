{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.configurations.tmux = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Tmux";
    };
  };
  config = lib.mkIf config.configurations.tmux.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      extraConfig = ''
        set-option -g default-shell ${pkgs.fish}/bin/fish
        set-option -g default-command ${pkgs.fish}/bin/fish
      '';
    };
  };
}
