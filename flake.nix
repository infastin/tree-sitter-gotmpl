{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          system = system;
        };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ tree-sitter ];
        };
      });
}
