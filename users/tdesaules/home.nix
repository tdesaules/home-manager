{
  system,
  nixpkgs,
  currentUsername,
  ...
}:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  username = "${currentUsername}";
  fishModule = import ../../modules/fish;
  starshipModule = import ../../modules/starship;
  tmuxModule = import ../../modules/tmux;
  alacrittyModule = import ../../modules/alacritty;
  fastfetchModule = import ../../modules/fastfetch;
  gitModule = import ../../modules/git;
  lazygitModule = import ../../modules/lazygit;
  firefoxModule = import ../../modules/firefox;
  vscodeModule = import ../../modules/vscode;
  nixfmtModule = import ../../modules/nixfmt-rfc-style;
in
{
  imports = [
    fishModule
    starshipModule
    tmuxModule
    alacrittyModule
    fastfetchModule
    gitModule
    lazygitModule
    firefoxModule
    vscodeModule
    nixfmtModule
  ];
  programs = {
    home-manager.enable = true;
  };
  home = {
    stateVersion = "25.05";
    username = "${username}";
    homeDirectory = "/home/${username}";
  };
  configurations = {
    git = {
      username = "${username}";
      mail = "thibault@desaules.me";
    };
  };
}
