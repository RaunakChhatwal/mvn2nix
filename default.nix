{ pkgs ? import <nixpkgs> {} }:
rec {
  buildMavenRepository =
    (pkgs.callPackage ./maven.nix {}).buildMavenRepository;

  buildMavenRepositoryFromLockFile =
    (pkgs.callPackage ./maven.nix {}).buildMavenRepositoryFromLockFile;

  mvn2nix = pkgs.callPackage ./derivation.nix { inherit buildMavenRepositoryFromLockFile; };

  mvn2nix-bootstrap = pkgs.callPackage ./derivation.nix { bootstrap = true; inherit buildMavenRepositoryFromLockFile; };
}
