#!/bin/bash
set -e

apt_packages=(
  fzf
  ripgrep
  fd-find
  python3
  python3-venv
  python3-pip
  pipx
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
  aspnetcore-runtime-9.0
  golang-go
  git-flow
  snapd
  cmake
)

snap_packages=(
)

read -e -p "Do you want to install Non Dev tools? y/n" installNonDevTools
if [ "$installNonDevTools" == "y" ]; then
  apt_packages+=(
    steam
  )
fi

read -e -p "Do you want to Setup i3? y/n" setupi3
if [ "$setupi3" == "y" ]; then
  echo ">>> Installing kitty"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  apt_packages+=(
    picom
    i3
    i3status
    rofi
    dmenu
    polybar
    alsa-utils
    acpi
    playerctl
  )
fi

echo ">>> Upating..."
sudo apt update

echo ">>> Stopping PackageKit to avoid lock conflicts..."
sudo systemctl stop packagekit

echo ">>> Updating package index..."
sudo apt-get update

if [ "$installNonDevTools" ]; then
  echo ">>> Installing Spotify..."
  curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update && sudo apt-get install spotify-client
fi

echo ">>> Installing node"
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
node -v     # Should print "v22.17.0".
nvm current # Should print "v22.17.0".
npm -v      # Should print "10.9.2".

echo ">>> Installing typescript"
npm install -g typescript

echo ">>> Updating package index..."
sudo apt-get update

echo ">>> Adding microsoft feed"
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

echo ">>> Installing NeoVim..."
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo rm nvim-linux-x86_64.tar.gz

echo ">>> Installing required APT packages..."
sudo apt-get install -y "${apt_packages[@]}"

echo ">>> Installing snap packages..."
for package in "${snap_packages[@]}"; do
  sudo snap install $package
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

DIR="$HOME/Desktop/Repos"
if [ ! -d "$DIR" ]; then
  echo ">>> Creating directory $DIR"
  mkdir -p "$DIR"
fi

echo ">>> Restarting PackageKit..."
sudo systemctl start packagekit

echo ">>> applying chezmoi"
chezmoi apply --force

echo ">>> installing nvim remote"
pipx install neovim-remote

echo ">>> Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# --- Final Message ---
echo "✔ All done!"
