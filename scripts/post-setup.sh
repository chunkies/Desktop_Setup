#!/bin/bash
set -e

apt_packages=(
  fzf
  ripgrep
  fd-find
  python3
  nodejs
  cargo
  zsh
  git
  curl
  wget
  unzip
  build-essential
  tmux
  dotnet-host
  dotnet-sdk-9.0
)

snap_packages=(
  spotify
  discord
)


echo ">>> Updating package index..."
sudo apt update

echo ">>> Adding microsoft feed"
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

echo ">>> Installing NeoVim..."
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo rm nvim-linux-x86_64.tar.gz

echo ">>> Installing required APT packages..."
for package in "${apt_packages[@]}"; do 
    sudo apt install -y $package
done

echo ">>> Installing snap packages"
for pkg in "${snap_packages[@]}"; do
  if ! snap list | grep -q "^$pkg "; then
    echo ">>> Installing $pkg via snap..."
    sudo snap install "$pkg" --classic --yes
  else
    echo "✔ $pkg is already installed via snap"
  fi
done

# --- Kitty config ---
KITTY_CONF="$HOME/.config/kitty"
if [ ! -d "$KITTY_CONF" ]; then
    echo ">>> Creating Kitty config..."
    mkdir -p "$KITTY_CONF"
    cp /usr/share/doc/kitty/examples/kitty.conf "$KITTY_CONF/" || true
fi

# --- Install Oh My Zsh if missing ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo ">>> Installing Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✔ Oh My Zsh already installed"
fi

# --- Set Zsh as default shell if not already ---
if [ "$SHELL" != "$(which zsh)" ]; then
    echo ">>> Setting Zsh as default shell..."
    chsh -s "$(which zsh)"
fi

# --- Install Nerd Font for icons (used in Trouble, NvimTree, etc.) ---
echo ">>> Installing Nerd Font (FiraCode)..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd "$FONT_DIR"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O FiraCode.zip
unzip -o FiraCode.zip
fc-cache -fv
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList list | grep -o "'[^']*'" | head -n1 | tr -d "'")
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" use-system-font false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" font 'FiraCode Nerd Font Mono 12'

# --- Final Message ---
echo "✔ All done!"

