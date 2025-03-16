{ lib, config, ... }:

{
  options.configurations.fish = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Fish";
    };
  };
  config = lib.mkIf config.configurations.fish.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        lzg = "lazygit";
      };
      shellInit = ''
        starship init fish | source
      '';
    };
  };
}
