{ config, pkgs, lib, ... }: with lib; {
  imports = [
    <nixpkgs/nixos/modules/profiles/clone-config.nix>
    ./core.nix
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      autoResize = true;
      fsType = "ext4";
    };
    "/mnt" = {
      device = ".host:/";
      # This doesn't work with the full path, so we rely on the systemPackage
      fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
      options = ["umask=22" "uid=1000" "gid=1000" "allow_other" "defaults" "auto_unmount"];
    };
  };

  boot.growPartition = true;
  boot.loader.grub.device = "/dev/sda";

  swapDevices = [{
    device = "/var/swap";
    size = 2048;
  }];

  virtualisation.vmware.guest.enable = true;
  system.stateVersion = mkDefault "21.05";

  services.xserver.videoDrivers = mkOverride 40 [ "vmware" ];
  powerManagement.enable = false;
}
