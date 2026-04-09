# Analytics Taxonomy (Strict Minimal-PII)

## Policy

- Anonymous IDs by default
- No email, name, phone, address, or free-form personal text in event payloads
- Event names and properties must be allowlisted in client code

## Event domains (phase 1)

- App lifecycle: `app_opened`
- Onboarding: `onboarding_started`, `onboarding_completed`
- Focus behavior: `focus_session_started`, `focus_session_completed`
- Monetization: `paywall_viewed`, `subscription_status_checked`

## Allowed shared properties

- `experiment_id` (string)
- `variant_id` (string)
- `source` (string enum)
- `screen_name` (string enum)

## Forbidden property keys

- `email`
- `name`
- `phone`
- `address`

## Experiment notes

- RevenueCat governs paywall experiments
- PostHog governs onboarding experiments
- Experiments must be documented in RFC before launch
