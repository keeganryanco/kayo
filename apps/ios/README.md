# KAYO iOS App

## Commands

```bash
xcodegen generate
xcodebuild -scheme KAYO -destination 'platform=iOS Simulator,name=iPhone 16' build
xcodebuild -scheme KAYO -destination 'platform=iOS Simulator,name=iPhone 16' test
```

## Structure

- `KAYO/App`: app entry and composition root
- `KAYO/Features`: user-facing features
- `KAYO/Analytics`: PostHog wrapper and allowlist contracts
- `KAYO/Monetization`: RevenueCat wrapper and paywall hooks
- `KAYO/Shared`: design and shared primitives
- `KAYO/Infrastructure`: configuration loading
