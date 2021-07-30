#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions
#  tinycc = pkgs.callPackage ./pkgs/tinycc { };
#  tinycc-unstable = pkgs.callPackage ./pkgs/tinycc/unstable.nix { 
#      inherit (pkgs.darwin) DarwinTools cctools;
#      #inherit (pkgs.darwin.apple_sdk.frameworks) CoreServices CoreFoundation;
#  };

  inherit (pkgs.callPackages ./pkgs/crystal {
    llvmPackages = pkgs.llvmPackages_10;
  })
    #crystal_0_33
    #crystal_0_34
    #crystal_0_35
    #crystal_0_36
    crystal_1_0
    crystal;

  inherit (pkgs.callPackage ./pkgs/shards { })
    #shards_0_11
    shards_0_15
    shards;

  mint = pkgs.callPackage ./pkgs/mint { };


}
