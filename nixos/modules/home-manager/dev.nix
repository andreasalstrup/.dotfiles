{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  home.packages = with pkgs; [
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-analyzer"
        "clippy"
        "rustfmt"
        "rust-docs"
        "rust-src"
      ];
    })

    clang
    cmake
  ];
}
