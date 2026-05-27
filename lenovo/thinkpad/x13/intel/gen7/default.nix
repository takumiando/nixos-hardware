{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../common/default.nix
  ];

  # Absolute minimum
  boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.17") (
    lib.mkDefault pkgs.linuxPackages_latest
  );

  boot.kernelParams = [
    "xe.enable_psr=1"
  ];
}
