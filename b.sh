#!/usr/bin/env bash

set -e

# -------------------------

# Brew packages

# -------------------------

BREW_PACKAGES=(
docker-compose
eza
ffmpeg
fzf
git
just
lazygit
neovim
node@22
pnpm
powerlevel10k
s3cmd
yazi
zoxide
zsh-autosuggestions
zsh-syntax-highlighting
rust
)

# -------------------------

# Cask packages

# -------------------------

CASK_PACKAGES=(
font-hack-nerd-font
"nikitabobko/tap/aerospace"
zen
neovide-app
slack
kitty
postman
dbeaver-community
docker-desktop
telegram-desktop
)

# -------------------------

# Install brew packages

# -------------------------

echo "📦 Installing brew packages..."
for pkg in "${BREW_PACKAGES[@]}"; do
echo "➡️ Installing $pkg"
brew install "$pkg"
done

# Ensure node@22 is linked

echo "🔗 Linking node@22..."
brew link --overwrite node@22

# -------------------------

# Install cask packages

# -------------------------

echo "🍺 Installing cask packages..."
for pkg in "${CASK_PACKAGES[@]}"; do
echo "➡️ Installing $pkg"
brew install --cask "$pkg"
done

echo "✅ All installations completed!"

