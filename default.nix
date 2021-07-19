#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions

  copyq = libsForQt5.callPackage ../applications/misc/copyq { };

}
