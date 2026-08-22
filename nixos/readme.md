```sh
nix flake check --experimental-features 'nix-command flakes'
```

```sh
sudo nixos-rebuild switch --flake .#desktop
```

```sh
nix flake check "github:andreasalstrup/.dotfiles/nixos?dir=nixos" --experimental-features 'nix-command flakes' --refresh
nix flake show "github:andreasalstrup/.dotfiles/nixos?dir=nixos" --extra-experimental-features 'nix-command flakes'
sudo nixos-install --flake "github:andreasalstrup/.dotfiles/nixos?dir=nixos#desktop"
```


```sh
nix --extra-experimental-features 'nix-command flakes' run nixpkgs#nixos-rebuild -- build-vm --flake .#vm
./result/bin/run-vm-vm

# clean up
rm -rf ./result vm.qcow2
```
