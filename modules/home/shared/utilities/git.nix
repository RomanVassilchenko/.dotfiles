{ lib, ... }:
{
  programs.git = {
    enable = true;
    userName = lib.mkForce "rovasilchenko";
    userEmail = lib.mkForce "rovasilchenko@ozon.ru";
  };
}
