#!/usr/bin/env bash
set -euo pipefail

# Basic secret-like patterns (kept intentionally conservative for baseline protection)
SECRET_PATHS=(apps packages docs scripts .github assets)
if rg -n --hidden \
  --glob '!**/.git/**' \
  --glob '!**/node_modules/**' \
  --glob '!**/.next/**' \
  '(?i)(api[_-]?key\s*[:=]\s*["'"'"'][A-Za-z0-9_\-]{16,}|sk_(live|test)_[A-Za-z0-9]{16,}|BEGIN (RSA|EC|OPENSSH) PRIVATE KEY)' \
  "${SECRET_PATHS[@]}"; then
  echo "Potential secret material detected."
  exit 1
fi

# Enforce forbidden analytics property keys in analytics payload definition files only
PII_PATHS=(apps/ios/KAYO/Analytics)
if [[ -d apps/web/lib/analytics ]]; then
  PII_PATHS+=(apps/web/lib/analytics)
fi

if rg -n --hidden --glob '!**/.git/**' '"(email|name|phone|address)"\s*:' "${PII_PATHS[@]}"; then
  echo "Forbidden analytics PII key detected in source payload definitions."
  exit 1
fi

echo "Security baseline scan passed."
