# RFC-0001: Monorepo Foundation (Phase 1)

- Status: Implemented
- Owner: AI Agent + Maintainer
- Created: 2026-04-09
- Target milestone: Foundation

## Summary

Establish a clean monorepo with iOS and web surfaces, shared brand tokens, deterministic asset generation, and strict RFC/security hygiene.

## Motivation

KAYO needs a disciplined base for rapid AI-assisted iteration without losing architecture, security, and documentation quality.

## Proposed changes

- Create `apps/ios`, `apps/web`, `packages/brand`, `docs`, `scripts`, and CI workflows.
- Enforce RFC-first process for major work.
- Add iOS app shell, web landing shell, and SDK wrapper contracts.
- Introduce generated icon/font/token pipeline.

## Security and privacy checklist

- [x] Data collection changes documented
- [x] Third-party SDK/service impact reviewed
- [x] Secret handling reviewed
- [x] PII policy alignment verified

## Implementation checklist

- [x] Scaffolding
- [x] Core implementation
- [x] Tests
- [x] Docs updates

## Rollout and validation

Validate with monorepo build/test/lint, iOS simulator build, and asset generation verification in CI.
