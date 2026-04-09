# Security Baseline

## Defaults

- No secrets committed to git
- Strict minimal-PII analytics posture
- Third-party SDK keys injected via environment/xcconfig only

## CI baseline checks

- Secret-pattern scan over tracked files
- Node dependency audit for web workspace
- Taxonomy guard: blocked PII keys cannot appear in event definitions

## Third-party services

- RevenueCat: paywall + entitlement orchestration
- PostHog: analytics + onboarding experimentation
- Apple App Store / App Store Connect: subscription and platform analytics

## iOS config handling

- `apps/ios/Config/Local.xcconfig` is gitignored
- `Debug.xcconfig` and `Release.xcconfig` include local overrides
- Placeholder values only in tracked config templates

## Incident protocol

1. Rotate impacted keys immediately.
2. Remove exposed values from repo history when applicable.
3. Document root cause and fix in RFC or postmortem note.
