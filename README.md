<div align="center">

<img src="fastfetch/logos/archlinux.png" width="150" alt="Banner"/>

**Hyprland-ready terminal dotfiles for Zsh, Kitty, and Fastfetch**

<a href="#quick-start-arch-linux"><img src="https://img.shields.io/badge/Install-7aa2f7?style=for-the-badge&logoColor=1a1b26" alt="Install"/></a>&ensp;
<a href="#kitty-theme"><img src="https://img.shields.io/badge/Kitty%20Theme-f5a97f?style=for-the-badge&logoColor=1a1b26" alt="Kitty Theme"/></a>&ensp;
<a href="#fastfetch"><img src="https://img.shields.io/badge/Fastfetch-c4a7e7?style=for-the-badge&logoColor=1a1b26" alt="Fastfetch"/></a>&ensp;
<a href="#usage-notes"><img src="https://img.shields.io/badge/Usage-9ece6a?style=for-the-badge&logoColor=1a1b26" alt="Usage"/></a>

[![Arch](https://img.shields.io/badge/Arch-1793D1?style=flat&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=flat&logo=wayland&logoColor=white)](https://hyprland.org/)
[![MIT](https://img.shields.io/badge/MIT-9ece6a?style=flat)](LICENSE)

</div>

# Hyprland Terminal Dotfiles

My first dotfiles project—any borrowed ideas or assets are called out and credited along the way.

Terminal-focused dotfiles used alongside a Hyprland desktop. The repo ships Zsh + Oh My Zsh with Powerlevel10k, a themed Kitty terminal, and Fastfetch with custom logos. Hope you enjoy it, and feel free to tweak and share improvements.

## What’s inside
- Shell: Oh My Zsh with Powerlevel10k prompt ([zsh/.zshrc](zsh/.zshrc), [zsh/.p10k.zsh](zsh/.p10k.zsh))
- Terminal: Kitty with the HyDE-inspired theme ([kitty/kitty.conf](kitty/kitty.conf), [kitty/theme.conf](kitty/theme.conf)) — see the [HyDE Project](https://github.com/HyDE-Project/HyDE)
- System info: Fastfetch layout and logos ([fastfetch/config.jsonc](fastfetch/config.jsonc), [fastfetch/logos](fastfetch/logos)) — adapted from [vyrx-dev/dotfiles](https://github.com/vyrx-dev/dotfiles)
- Installer: Arch-friendly bootstrap for packages and local copies ([install.sh](install.sh))

## Quick start (Arch Linux)
1. Clone to `~/dotfiles` (or adjust paths accordingly).
2. Make the installer executable: `chmod +x install.sh`.
3. Run it: `./install.sh`.

The script installs the required packages (git, curl, zsh, kitty, fastfetch, GitHub CLI, JetBrainsMono Nerd Font), sets up Oh My Zsh, Powerlevel10k, common Zsh plugins, and copies configs into `~/.config/kitty`, `~/.config/fastfetch`, and your home directory.

## Kitty theme
- Uses the Catppuccin Mocha palette via [kitty/theme.conf](kitty/theme.conf).
- Config includes blur, opacity, and tab styling in [kitty/kitty.conf](kitty/kitty.conf).
- Inspired by the [HyDE Project](https://github.com/HyDE-Project/HyDE); tweak colors directly in `theme.conf` to keep the include intact.

## Fastfetch
- Layout and glyph styling live in [fastfetch/config.jsonc](fastfetch/config.jsonc), adapted from [vyrx-dev/dotfiles](https://github.com/vyrx-dev/dotfiles).
- Logos are bundled in [fastfetch/logos](fastfetch/logos); swap the `logo.source` path in the config if you add your own art.

## Usage notes
- Kitty includes `theme.conf`; if you tweak colors, edit [kitty/theme.conf](kitty/theme.conf) to keep the include working.
- Fastfetch references the bundled logos directory. Add your own images to [fastfetch/logos](fastfetch/logos) and point `logo.source` in [fastfetch/config.jsonc](fastfetch/config.jsonc) if desired.
- The prompt calls Fastfetch at shell start; comment out the first lines in [zsh/.zshrc](zsh/.zshrc) if you prefer a faster login.

## Credits
- Kitty theme inspiration: [HyDE Project](https://github.com/HyDE-Project/HyDE)
- Fastfetch layout and assets: [vyrx-dev/dotfiles](https://github.com/vyrx-dev/dotfiles)
- Powerlevel10k, Oh My Zsh, and their respective communities
