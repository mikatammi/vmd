{
  description = "Virtual Machine Daemon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        # package = craneLib.buildPackage {
        #   pname = "vmd";
        #   version = "0.1.0";
        #   src = craneLib.cleanCargoSource (craneLib.path ./.);
        #   nativeBuildInputs = with pkgs; [
        #     gnumake
        #     pkg-config
        #     openapi-generator-cli
        #     openssl.dev
        #     rustc
        #     cargo
        #   ];
        #   PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
        # };
      in {
        packages.vmd-rust-server-api = nixpkgs.legacyPackages.${system}.callPackage ./vmd-api {
          apiType = "server";
        };
        packages.vmd-rust-client-api = nixpkgs.legacyPackages.${system}.callPackage ./vmd-api {
          apiType = "client";
        };

        formatter = nixpkgs.legacyPackages.${system}.alejandra;
      }
    );
}
