#!/usr/bin/env bash

# ===================================================
# gin-go-migration Installer / Uninstaller
# Supports: macOS, Linux, Windows (Git Bash)
# ===================================================
# Usage:
#   ./install.sh              -> install
#   ./install.sh uninstall    -> uninstall
# ===================================================

set -e

SCRIPT_NAME="gin-go-migration"
INSTALL_DIR=""
OS_TYPE=""

# Detect OS
case "$(uname -s)" in
  Linux*)   OS_TYPE="linux" ;;
  Darwin*)  OS_TYPE="mac" ;;
  CYGWIN*|MINGW*|MSYS*) OS_TYPE="windows" ;;
  *)        OS_TYPE="unknown" ;;
esac

# Determine install directory
if [ "$OS_TYPE" = "linux" ] || [ "$OS_TYPE" = "mac" ]; then
  INSTALL_DIR="/usr/local/bin"
elif [ "$OS_TYPE" = "windows" ]; then
  INSTALL_DIR="/c/Program Files/gin-go-migration"
else
  echo "❌ Unsupported OS. Exiting..."
  exit 1
fi

# Function: uninstall
uninstall() {
  echo "🧹 Uninstalling gin-go-migration..."

  if [ "$OS_TYPE" = "windows" ]; then
    sudo rm -f "$INSTALL_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME.bat" 2>/dev/null || true
  else
    sudo rm -f "$INSTALL_DIR/$SCRIPT_NAME" 2>/dev/null || true
  fi

  echo "✅ Uninstalled successfully (if installed)."
  echo ""
  echo "You can verify by running: which gin-go-migration"
  exit 0
}

# Handle uninstall command
if [ "$1" = "uninstall" ]; then
  uninstall
fi

# Ensure script exists before installing
if [ ! -f "./$SCRIPT_NAME" ]; then
  echo "❌ Error: $SCRIPT_NAME not found in current directory."
  echo "   Please make sure install.sh is in the same folder as $SCRIPT_NAME."
  exit 1
fi

echo "🧩 Detected OS: $OS_TYPE"
echo "📦 Installing $SCRIPT_NAME to $INSTALL_DIR ..."

# Create directory and copy script
sudo mkdir -p "$INSTALL_DIR"
sudo cp "./$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Windows: create batch wrapper for CMD/PowerShell
if [ "$OS_TYPE" = "windows" ]; then
  BAT_FILE="${INSTALL_DIR}/${SCRIPT_NAME}.bat"
  echo "@echo off" | sudo tee "$BAT_FILE" > /dev/null
  echo "bash \"%~dp0$SCRIPT_NAME\" %*" | sudo tee -a "$BAT_FILE" > /dev/null
  echo "✅ Created Windows wrapper: $BAT_FILE"
fi

# Final confirmation
echo ""
echo "✅ Installation complete!"
echo ""
echo "You can now use the command:"
echo "  $SCRIPT_NAME create add_new_table"
echo ""
echo "If command not found, try restarting your terminal."
echo ""
echo "To uninstall later, run:"
echo "  ./install.sh uninstall"
