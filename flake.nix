{
  description = "vicko NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # replacement for ls
    eza.url = "github:eza-community/eza";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {
      	os = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
            ./nixos/configuration.nix
          ];
      };
    };
    homeConfigurations = {
          vickoHome = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [./home/home.nix];
      };
    };
  };
}

