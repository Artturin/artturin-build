#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions

}
