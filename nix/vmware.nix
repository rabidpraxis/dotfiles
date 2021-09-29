{ config, pkgs, lib, ... }: {
  virtualisation.vmware.guest.enable = true;

  fileSystems."/mnt" = {
    device = ".host:/";
    # This doesn't work with the full path, so we rely on the systemPackage
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    options = ["umask=22" "uid=1000" "gid=1000" "allow_other" "defaults" "auto_unmount"];
  };

  imports = [ ./core.nix ];
}
