{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.configurations.nixfmt-rfc-style = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Nixfmt (RFC Style)";
    };
  };
  config = lib.mkIf config.configurations.nixfmt-rfc-style.enable {
    home.packages = with pkgs; [ nixfmt-rfc-style ];
  };
}
