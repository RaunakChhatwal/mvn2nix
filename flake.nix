{
  description = "Easily package your Maven Java application with the Nix package manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system: rec {
    packages = import ./default.nix { pkgs = import nixpkgs { inherit system; }; };
    defaultPackage = packages.mvn2nix;
    apps.mvn2nix = flake-utils.lib.mkApp { drv = packages.mvn2nix; };
  });
}
