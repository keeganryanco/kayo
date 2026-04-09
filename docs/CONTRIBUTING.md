# Contributing to KAYO

## Core principles

- RFC-first for major work
- Small, focused files and modules
- Security and privacy by default
- Deterministic generation for derived assets

## What counts as a major change (RFC required)

An RFC is required when a change impacts one or more of these:

- Architecture, build tooling, or repository layout
- New core product flow (onboarding, paywall, experiments)
- Data collection, analytics taxonomy, or third-party SDK behavior
- Security posture, auth behavior, or secret handling

## Small-file protocol

- Aim to keep source files under ~250 lines when practical
- Split features by concern (`View`, `ViewModel`/state, client wrappers, config)
- Avoid adding large utility files with unrelated responsibilities
- Generated files are exempt if produced by repo scripts

## Branch and PR protocol

- Use short-lived feature branches from `main`
- Open PRs early and keep scope constrained
- Link RFC in PR description for major changes
- Include checklist updates in the RFC file as work progresses

## Generated files

- Do not hand-edit generated icon sets or generated Swift token files
- Use:
  - `pnpm run generate:assets`
  - `pnpm run generate:brand`

## Security and privacy

- Never commit API keys/secrets
- Follow strict minimal-PII analytics policy in `docs/analytics-taxonomy.md`
- Update `docs/security-baseline.md` when SDK scopes or data flows change
