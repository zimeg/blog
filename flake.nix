{
  description = "configurations for blogged blots";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_22
          ];
        };
        packages.tofu = pkgs.writeShellScriptBin "tofu" ''
          ${pkgs.opentofu}/bin/tofu $@
        '';
      }
    );
}
