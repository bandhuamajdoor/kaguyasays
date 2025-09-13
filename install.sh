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
Aaj kamayenga toh kal baith kar khayenga
apni mehnat par bharosa rakh, pyaar toh dubara bhi hojayenga

AAAAAAA MERIII JAAAANNNN
%%
Pyaar vyaar sb dhoka h,
padhle beta mauka h.
%%
Tu toh Google bhi khol ke bakwaas hi search karega.
%%
Tere jaise ko dekh ke lagta hai WiFi password bhi 'chotu123' hoga.
%%
duckkk me fadddyyy.
%%
Iss janam mai main hi milungi.
SINGLE LAVDA :_(
%%
I got in a lot of trouble on a date recently, because I didn't open the car door for her.
Instead, I just swam to the surface :)
%%
gaand fatte toh fatte
par nawabi na ghate
%%
bangya shana terminal kholke?
%%
The dildo of consequences rarely arrives lubed </3
%%
elvissh bhai ke aage koi BOL SKTAA HAI KYAA?!!
%%
Padhai likhai ek dhoka h,
latak jao beta yehi mauka h.
%%
"Kissing homies goodnight isn't gay"
                              -sun tzu
%%
Koi aapse pyaar kyu karega? :_(
%%
Mai bhi changa, mera pio bhi changa,
meri maa bhi changi
RISHTEDAAR BEHENCHOD
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
