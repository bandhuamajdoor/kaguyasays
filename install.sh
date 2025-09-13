#!/bin/bash
set -e

GREEN="\033[1;32m"
RESET="\033[0m"

REPO_URL="https://raw.githubusercontent.com/bandhuamajdoor/kaguyasays/main"

echo -e "${GREEN}Installing kaguyasays...${RESET}"

CONFIG_DIR="$HOME/.config/kaguyasays"
BIN_DIR="/usr/local/bin"
SCRIPT_PATH="$BIN_DIR/kaguyasays"

mkdir -p "$CONFIG_DIR"

# Install quotes.txt if missing
if [ ! -f "$CONFIG_DIR/quotes.txt" ]; then
  cat >"$CONFIG_DIR/quotes.txt" <<'EOF'
Hello, this is a sample quote.
%%
Multi-line
quotes
work
too!
EOF
  echo "Created $CONFIG_DIR/quotes.txt"
else
  echo "Found existing quotes.txt, leaving it untouched."
fi

# Install kagu.png
if [ ! -f "$CONFIG_DIR/kagu.png" ]; then
  if [ -f "$(dirname "$0")/kagu.png" ]; then
    cp "$(dirname "$0")/kagu.png" "$CONFIG_DIR/kagu.png"
    echo "Installed local kagu.png"
  else
    echo "Downloading kagu.png from GitHub..."
    curl -fsSL "$REPO_URL/kagu.png" -o "$CONFIG_DIR/kagu.png"
  fi
fi

# Install script
if [ -f "$(dirname "$0")/kaguyasays" ]; then
  sudo cp "$(dirname "$0")/kaguyasays" "$SCRIPT_PATH"
else
  echo "Downloading kaguyasays script from GitHub..."
  curl -fsSL "$REPO_URL/kaguyasays" | sudo tee "$SCRIPT_PATH" >/dev/null
fi

sudo chmod +x "$SCRIPT_PATH"
echo "Installed kaguyasays to $SCRIPT_PATH"

# Install dependencies
echo -e "${GREEN}Installing dependencies...${RESET}"
if command -v apt >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y chafa lolcat fortune
elif command -v pacman >/dev/null 2>&1; then
  sudo pacman -Sy --noconfirm chafa lolcat fortune-mod
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y chafa lolcat fortune-mod
elif command -v brew >/dev/null 2>&1; then
  brew install chafa lolcat fortune
else
  echo "⚠️  Install manually: chafa lolcat fortune"
fi

echo -e "${GREEN}Done! Run: kaguyasays${RESET}"
