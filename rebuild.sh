export NIXPKGS_ALLOW_UNFREE=1
nixos-rebuild switch --impure --flake /home/tritium/SnowFlakes --show-trace --fast
