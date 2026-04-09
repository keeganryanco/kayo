#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/assets/source"
ICON_SOURCE="$SOURCE_DIR/icons/kayo_medium_light.png"
FONT_OTF_SOURCE="$SOURCE_DIR/fonts/GillKayoCondensedPlain.otf"
FONT_WOFF_SOURCE="$SOURCE_DIR/fonts/GillKayoCondensedPlain.woff"

IOS_FONT_DIR="$ROOT_DIR/apps/ios/KAYO/Fonts"
IOS_ICON_DIR="$ROOT_DIR/apps/ios/KAYO/Assets.xcassets/AppIcon.appiconset"
WEB_GEN_DIR="$ROOT_DIR/apps/web/public/generated"

mkdir -p "$IOS_FONT_DIR" "$IOS_ICON_DIR" "$WEB_GEN_DIR/icons" "$WEB_GEN_DIR/fonts"

cp "$FONT_OTF_SOURCE" "$IOS_FONT_DIR/GillKayoCondensedPlain.otf"
cp "$FONT_WOFF_SOURCE" "$WEB_GEN_DIR/fonts/GillKayoCondensedPlain.woff"
cp "$FONT_OTF_SOURCE" "$WEB_GEN_DIR/fonts/GillKayoCondensedPlain.otf"

# Web icon outputs
cp "$SOURCE_DIR/icons/kayo_large_light.png" "$WEB_GEN_DIR/icons/logo-1552.png"
sips -z 32 32 "$SOURCE_DIR/icons/kayo_medium_light.png" --out "$WEB_GEN_DIR/favicon-32.png" >/dev/null
sips -z 180 180 "$SOURCE_DIR/icons/kayo_medium_light.png" --out "$WEB_GEN_DIR/apple-touch-icon.png" >/dev/null
sips -z 192 192 "$SOURCE_DIR/icons/kayo_medium_light.png" --out "$WEB_GEN_DIR/icons/icon-192.png" >/dev/null
sips -z 512 512 "$SOURCE_DIR/icons/kayo_medium_light.png" --out "$WEB_GEN_DIR/icons/icon-512.png" >/dev/null

TMP_OG="$WEB_GEN_DIR/icons/.tmp-og.png"
cp "$SOURCE_DIR/icons/kayo_large_light.png" "$TMP_OG"
sips -c 815 1552 "$TMP_OG" --out "$TMP_OG" >/dev/null
sips -z 630 1200 "$TMP_OG" --out "$WEB_GEN_DIR/og-1200x630.png" >/dev/null
rm -f "$TMP_OG"

# iOS AppIcon outputs (marketing icon must not have alpha)
render_icon() {
  local points="$1"
  local scale="$2"
  local filename="$3"
  local pixels=$((points * scale))
  local tmp="$IOS_ICON_DIR/.tmp-${filename}"

  sips -z "$pixels" "$pixels" "$ICON_SOURCE" --out "$tmp" >/dev/null
  swift "$ROOT_DIR/scripts/flatten-alpha.swift" "$tmp" "$IOS_ICON_DIR/$filename" "F3C95E" >/dev/null
  rm -f "$tmp"
}

render_icon 20 2 "Icon-App-20x20@2x.png"
render_icon 20 3 "Icon-App-20x20@3x.png"
render_icon 29 2 "Icon-App-29x29@2x.png"
render_icon 29 3 "Icon-App-29x29@3x.png"
render_icon 40 2 "Icon-App-40x40@2x.png"
render_icon 40 3 "Icon-App-40x40@3x.png"
render_icon 60 2 "Icon-App-60x60@2x.png"
render_icon 60 3 "Icon-App-60x60@3x.png"
render_icon 1024 1 "Icon-App-1024x1024@1x.png"

cat > "$IOS_ICON_DIR/Contents.json" <<'JSON'
{
  "images" : [
    { "size" : "20x20", "idiom" : "iphone", "filename" : "Icon-App-20x20@2x.png", "scale" : "2x" },
    { "size" : "20x20", "idiom" : "iphone", "filename" : "Icon-App-20x20@3x.png", "scale" : "3x" },
    { "size" : "29x29", "idiom" : "iphone", "filename" : "Icon-App-29x29@2x.png", "scale" : "2x" },
    { "size" : "29x29", "idiom" : "iphone", "filename" : "Icon-App-29x29@3x.png", "scale" : "3x" },
    { "size" : "40x40", "idiom" : "iphone", "filename" : "Icon-App-40x40@2x.png", "scale" : "2x" },
    { "size" : "40x40", "idiom" : "iphone", "filename" : "Icon-App-40x40@3x.png", "scale" : "3x" },
    { "size" : "60x60", "idiom" : "iphone", "filename" : "Icon-App-60x60@2x.png", "scale" : "2x" },
    { "size" : "60x60", "idiom" : "iphone", "filename" : "Icon-App-60x60@3x.png", "scale" : "3x" },
    { "size" : "1024x1024", "idiom" : "ios-marketing", "filename" : "Icon-App-1024x1024@1x.png", "scale" : "1x" }
  ],
  "info" : { "version" : 1, "author" : "xcode" }
}
JSON

echo "Asset generation complete."
