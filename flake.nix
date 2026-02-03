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
            pkgs.nodejs_22
          ];
        };
      });
      apps = each (pkgs: {
        default = {
          type = "app";
          program = "${pkgs.writeShellScript "blog" ''
            WORKDIR=$(mktemp -d)
            cp -r ${self}/. "$WORKDIR"
            cd "$WORKDIR"
            ${pkgs.nodejs_22}/bin/npm ci --omit=dev
            ${pkgs.nodejs_22}/bin/npm run build
            exec ${pkgs.nodejs_22}/bin/npm run host -- "$@"
          ''}";
        };
      });
      packages = each (pkgs: {
        tofu = pkgs.writeShellScriptBin "tofu" ''
          ${pkgs.opentofu}/bin/tofu $@
        '';
      });
    };
}
