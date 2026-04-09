#!/usr/bin/env bash
set -euo pipefail

ICON_DIR="apps/ios/KAYO/Assets.xcassets/AppIcon.appiconset"
REQUIRED=(
  "Icon-App-20x20@2x.png"
  "Icon-App-20x20@3x.png"
  "Icon-App-29x29@2x.png"
  "Icon-App-29x29@3x.png"
  "Icon-App-40x40@2x.png"
  "Icon-App-40x40@3x.png"
  "Icon-App-60x60@2x.png"
  "Icon-App-60x60@3x.png"
  "Icon-App-1024x1024@1x.png"
)

for file in "${REQUIRED[@]}"; do
  if [[ ! -f "$ICON_DIR/$file" ]]; then
    echo "Missing icon: $ICON_DIR/$file"
    exit 1
  fi
done

HAS_ALPHA=$(sips -g hasAlpha "$ICON_DIR/Icon-App-1024x1024@1x.png" | awk '/hasAlpha/ {print $2}')
if [[ "$HAS_ALPHA" != "no" ]]; then
  echo "Marketing icon must not include alpha channel"
  exit 1
fi

echo "Icon verification passed."
