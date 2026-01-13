#!/bin/bash
set -e

echo "==> Installation de l'environnement terminal (Arch Linux)"

# -------------------------
# 1. Paquets système
# -------------------------
echo "==> Installation des paquets nécessaires..."
sudo pacman -S --needed --noconfirm \
  git \
  curl \
  zsh \
  kitty \
  github-cli \
  ttf-jetbrains-mono-nerd

# -------------------------
# 2. Oh My Zsh
# -------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installation de Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh déjà installé"
fi

# -------------------------
# 3. Powerlevel10k
# -------------------------
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  echo "==> Installation de Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
else
  echo "==> Powerlevel10k déjà installé"
fi

# -------------------------
# 4. Plugins Zsh
# -------------------------
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"

if [ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]; then
  echo "==> Installation zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]; then
  echo "==> Installation zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    "$ZSH_CUSTOM/zsh-syntax-highlighting"
fi

# -------------------------
# 5. Lier les dotfiles
# -------------------------
echo "==> Installation des dotfiles..."

ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

mkdir -p "$HOME/.config/kitty"
ln -sf "$HOME/dotfiles/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# -------------------------
# 6. Définir Zsh comme shell par défaut
# -------------------------
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  echo "==> Définition de Zsh comme shell par défaut..."
  chsh -s /usr/bin/zsh
fi

# -------------------------
# 7. Fin
# -------------------------
echo
echo "✅ Installation terminée avec succès"
echo "➡️ Déconnecte-toi ou lance : exec zsh"
