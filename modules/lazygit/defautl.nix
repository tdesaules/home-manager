{ lib, config, ... }:

{
  options.configurations.lazygit = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Lazygit";
    };
  };
  config = lib.mkIf config.configurations.lazygit.enable { programs.lazygit.enable = true; };
}
