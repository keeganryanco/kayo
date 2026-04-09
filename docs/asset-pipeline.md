# Asset Pipeline

## Source-of-truth assets

- `assets/source/fonts/GillKayoCondensedPlain.otf`
- `assets/source/fonts/GillKayoCondensedPlain.woff`
- `assets/source/icons/kayo_medium_light.png` (master icon source)
- Additional logos in `assets/source/icons/*` remain immutable source assets

## Generation commands

```bash
pnpm run generate:assets
pnpm run generate:brand
```

`generate:assets` currently depends on macOS tooling (`sips` + Swift/AppKit).

## Generated outputs

- iOS app icon set: `apps/ios/KAYO/Assets.xcassets/AppIcon.appiconset`
- iOS bundled font: `apps/ios/KAYO/Fonts/GillKayoCondensedPlain.otf`
- Web fonts/icons: `apps/web/public/generated/*`
- Swift brand tokens: `apps/ios/KAYO/Shared/Design/Generated/BrandTokens.swift`

## Rules

- Do not edit generated files manually
- Regenerate after any source icon/font/token change
- App Store icon output must not contain alpha channel
