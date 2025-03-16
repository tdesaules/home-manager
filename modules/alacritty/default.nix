{ lib, config, ... }:

{
  options.configurations.alacritty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Alacritty";
    };
  };
  config = lib.mkIf config.configurations.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            family = "DejaVuSansM Nerd Font Mono";
            style = "Regular";
          };
          size = 10.75;
        };
        terminal.shell = {
          program = "fish";
          args = [
            "-l"
            "-c"
            "tmux attach || tmux"
          ];
        };
      };
    };
  };
}
