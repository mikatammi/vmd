{
  lib,
  stdenv,
  openapi-generator-cli,
  apiType, # Set this to either server or client in callPackage
}:
stdenv.mkDerivation {
  name = "vmd-rust-${apiType}-api-src";
  version = "0.1.0";
  src = ./openapi.yaml;
  nativeBuildInputs = [
    openapi-generator-cli
  ];

  openapiGeneratorExtraArgs =
    lib.optionals (apiType == "server") [
      "--additional-properties=packageName=vmd-rust-server-api"
    ]
    ++ lib.optionals (apiType == "client") [
      "--additional-properties=supportAsync=true"
      "--additional-properties=packageName=vmd-rust-client-api"
    ];

  dontUnpack = true;
  buildPhase = ''
    ${openapi-generator-cli}/bin/openapi-generator-cli \
      generate \
      -g rust-server \
      -i $src \
      -o $out \
      $openapiGeneratorExtraArgs
  '';
}
