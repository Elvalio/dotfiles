#!/bin/bash
set -e

echo "==> Terminal environment setup (Arch Linux)"

# -------------------------
# 1. System packages
# -------------------------
echo "==> Installing required packages..."
sudo pacman -S --needed --noconfirm \
  git \
  curl \
  zsh \
  kitty \
  fastfetch \
  github-cli \
  ttf-jetbrains-mono-nerd

# -------------------------
# 2. Oh My Zsh
# -------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh already present"
fi

# -------------------------
# 3. Powerlevel10k
# -------------------------
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  echo "==> Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
else
  echo "==> Powerlevel10k already present"
fi

# -------------------------
# 4. Zsh plugins
# -------------------------
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"

if [ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]; then
  echo "==> Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]; then
  echo "==> Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    "$ZSH_CUSTOM/zsh-syntax-highlighting"
fi

# -------------------------
# 5. Install dotfiles (copy)
# -------------------------
echo "==> Copying dotfiles..."

cp -f "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
cp -f "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

mkdir -p "$HOME/.config/kitty"
cp -f "$HOME/dotfiles/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
cp -f "$HOME/dotfiles/kitty/theme.conf" "$HOME/.config/kitty/theme.conf"

mkdir -p "$HOME/.config/fastfetch"
cp -f "$HOME/dotfiles/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
rm -rf "$HOME/.config/fastfetch/logos"
cp -r "$HOME/dotfiles/fastfetch/logos" "$HOME/.config/fastfetch/logos"

# -------------------------
# 6. Set Zsh as default shell
# -------------------------
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  echo "==> Setting Zsh as the default shell..."
  chsh -s /usr/bin/zsh
fi

# -------------------------
# 7. Done
# -------------------------
echo
echo "✅ Installation completed successfully"
echo "➡️ Log out or run: exec zsh"
