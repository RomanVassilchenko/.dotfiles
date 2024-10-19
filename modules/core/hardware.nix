{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  environment.systemPackages = with pkgs; [ solaar ];
}
