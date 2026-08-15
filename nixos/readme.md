```sh
nix flake check --experimental-features 'nix-command flakes'
```

```sh
sudo nixos-rebuild switch --flake .#desktop
```

```sh
nix flake check "github:andreasalstrup/.dotfiles/nixos?dir=nixos" --experimental-features 'nix-command flakes'
nix flake show "github:andreasalstrup/.dotfiles/nixos?dir=nixos" --extra-experimental-features 'nix-command flakes'
sudo nixos-install --flake "github:andreasalstrup/.dotfiles/nixos?dir=nixos#desktop"
```

