{ lib, config, ... }:

{
  options.configurations.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Git";
    };
    username = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Git username.";
    };
    mail = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Git email.";
    };
  };
  config = lib.mkIf config.configurations.git.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = config.configurations.git.username;
      userEmail = config.configurations.git.mail;
      extraConfig = {
        core.editor = "code --wait";
      };
    };
  };
}
