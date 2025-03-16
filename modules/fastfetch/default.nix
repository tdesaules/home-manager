{ lib, config, ... }:

{
  options.configurations.fastfetch = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Fastfetch";
    };
  };
  config = lib.mkIf config.configurations.fastfetch.enable { programs.fastfetch.enable = true; };
}
