#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions
  tinycc = pkgs.callPackage ./pkgs/tinycc { };
  tinycc-unstable = pkgs.callPackage ./pkgs/tinycc/unstable.nix { };


}
