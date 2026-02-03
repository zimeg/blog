{
  description = "configurations for blogged blots";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    { self, nixpkgs, ... }:
    let
      each =
        function:
        nixpkgs.lib.genAttrs [
          "aarch64-darwin"
          "aarch64-linux"
          "x86_64-darwin"
          "x86_64-linux"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      devShells = each (pkgs: {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_22 # https://github.com/nodejs/node
            pkgs.opentofu # https://github.com/opentofu/opentofu
          ];
        };
      });
      apps = each (pkgs: {
        default = {
          type = "app";
          program = "${pkgs.writeShellApplication {
            name = "blog";
            runtimeInputs = [
              pkgs.bash # https://cgit.git.savannah.gnu.org/cgit/bash.git
              pkgs.coreutils # https://github.com/coreutils/coreutils
              pkgs.nodejs_22 # https://github.com/nodejs/node
            ];
            text = ''
              WORKDIR=$(mktemp -d)
              cp -r ${self}/. "$WORKDIR"
              cd "$WORKDIR"
              npm ci --omit=dev
              npm run build
              exec npm run host -- "$@"
            '';
          }}/bin/blog";
        };
      });
    };
}
