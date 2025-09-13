#!/bin/bash
# uninstall.sh - Remove kaguyasays and its config safely

set -e

echo "Uninstalling kaguyasays..."
echo
read -rp "Are you sure you want to uninstall kaguyasays? [y/N]: " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Uninstall cancelled."
  exit 1
fi

# Remove the binary
if [ -f "/usr/local/bin/kaguyasays" ]; then
  sudo rm /usr/local/bin/kaguyasays
  echo "Removed /usr/local/bin/kaguyasays"
else
  echo "No binary found at /usr/local/bin/kaguyasays"
fi

# Remove config folder
if [ -d "$HOME/.config/kaguyasays" ]; then
  rm -rf "$HOME/.config/kaguyasays"
  echo "Removed $HOME/.config/kaguyasays"
else
  echo "No config folder found at $HOME/.config/kaguyasays"
fi

echo "kaguyasays has been fully uninstalled."
