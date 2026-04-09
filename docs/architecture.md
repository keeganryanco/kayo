# Architecture Overview

## Surfaces

- `apps/ios`: SwiftUI app, iOS 17+, XcodeGen-managed project
- `apps/web`: Next.js site on Vercel, includes minimal `/api/health` route
- `packages/brand`: shared KAYO brand tokens and generated Swift constants

## iOS layer map

- `App`: app entrypoint and root navigation
- `Features`: user-facing flows (home, onboarding)
- `Analytics`: PostHog wrapper with explicit event allowlist
- `Monetization`: RevenueCat wrapper for entitlement/paywall hooks
- `Shared`: design tokens, typography helpers, shared UI support
- `Infrastructure`: environment/config loading

## Web layer map

- `app/`: App Router pages, metadata, API routes
- `public/`: generated icons and static assets
- Consumes `@kayo/brand` for colors/type/copy direction

## Shared contracts

- Brand tokens are source-of-truth in `packages/brand/src/tokens.ts`
- Generated Swift constants mirror the same tokens
- Analytics events must be represented in taxonomy docs before usage
