#!/bin/bash

# Linux SysAdmin Tools Uninstaller

INSTALL_DIR="$HOME/.local/bin"

TOOLS=(
disk-usage-check
logrotate-check
nightly-backup
service-watch
)

echo "Removing Linux SysAdmin Tools..."

for tool in "${TOOLS[@]}"; do

    if [ -f "$INSTALL_DIR/$tool" ]; then
        rm "$INSTALL_DIR/$tool"
        echo "Removed $tool"
    else
        echo "$tool not found"
    fi

done

echo ""
echo "Uninstall complete"
