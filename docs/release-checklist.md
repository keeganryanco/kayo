# Release Checklist

## Pre-release

- [ ] RFC checklist complete for all major included changes
- [ ] `pnpm run build`, `pnpm run test`, and `pnpm run lint` pass
- [ ] iOS simulator build passes after `xcodegen generate`
- [ ] Asset generation scripts run and outputs are current

## Security and privacy

- [ ] No secrets in diff
- [ ] Analytics events align with allowlist and taxonomy
- [ ] Dependency audit reviewed

## Store and web

- [ ] App icon set verified (no alpha in App Store icon)
- [ ] Website CTA points to current App Store URL
- [ ] Metadata and OG assets render correctly
