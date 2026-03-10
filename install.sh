#!/bin/bash

# Linux SysAdmin Tools Installer

TOOLS_DIR="$(pwd)/tools"
INSTALL_DIR="$HOME/.local/bin"

echo "Installing Linux SysAdmin Tools..."

mkdir -p "$INSTALL_DIR"

for tool in "$TOOLS_DIR"/*; do

    tool_name=$(basename "$tool")

    echo "Installing $tool_name..."

    cp "$tool" "$INSTALL_DIR/$tool_name"

    chmod +x "$INSTALL_DIR/$tool_name"

done

echo ""
echo "Installation complete"
echo "Tools installed in: $INSTALL_DIR"
