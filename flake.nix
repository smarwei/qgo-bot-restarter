{
  description = "A simple flake to restart the Quantum Go Bots";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; stdenv.mkDerivation rec {
      pname = "restart-qgo-bots";
      version = "0.0.1";

      src = null;

      phases = [ "installPhase" ];

      installPhase = ''
        mkdir -p $out/bin
        cat > $out/bin/restart-bots <<EOF
        #!/bin/sh

        docker stop prodbots-malli
        docker rm prodbots-malli
        docker run -d --name prodbots-malli --restart=always --network=host indeedael/qgo-ai:100.0 --fast 1 m

        docker stop prodbots-qnugo
        docker rm prodbots-qnugo
        docker run -d --name prodbots-qnugo --restart=always --network=host indeedael/qgo-ai:100.0 --fast 1 q

        EOF
        chmod +x $out/bin/restart-bots
      '';

      meta = {
        description = "A script to restart the Quantum Go bots";
        platforms = nixpkgs.lib.platforms.linux;
      };
    };
  };
}

