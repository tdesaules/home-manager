{ lib, config, ... }:

{
  options.configurations.firefox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Firefox";
    };
  };
  config = lib.mkIf config.configurations.firefox.enable { programs.firefox.enable = true; };
}
