# Restart Quantum Go Bots

This repository contains a Nix flake that defines a package to manage Quantum Go Bots.

## Description

The `restart-qgo-bots` package installs a bash script that stops and removes a running Docker container named `prodbots-malli`, and then runs a new one with the same name. The new Docker container is run using the `indeedael/qgo-ai:100.0` image, with specific flags and parameters.

## Prerequisites

- You need to have <code>Nix</code> with flakes support installed on your system.
- Docker should be installed and running.
- The user should have sufficient permissions to run Docker commands.

## Usage

After cloning the repository, you can build the package with the following command:

<code>nix build</code>

This will create a `result` symlink in the project directory that points to the built package in the Nix store.

You can then run the installed script with the following command:

<code>./result/bin/restart-bots</code>

This will stop and remove the `prodbots-malli` Docker container if it's running, and start a new one.

## Version

The current version of the package is `0.0.1`.

## License

Please see the [LICENSE](./LICENSE) file for details.

