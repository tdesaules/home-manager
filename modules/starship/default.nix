{ lib, config, ... }:

{
  options.configurations.starship = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Starship";
    };
  };
  config = lib.mkIf config.configurations.starship.enable { programs.starship.enable = true; };
}
