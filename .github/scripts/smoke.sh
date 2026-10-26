#!/usr/bin/env bash
set -euo pipefail

# Exercise the same install, build, and preview command as the systemd units.
port=14321
url="http://127.0.0.1:$port/"
if curl --silent --output /dev/null --max-time 2 "$url"; then
  printf 'Smoke-test port %s is already in use\n' "$port" >&2
  exit 1
fi

setsid nix run . -- --port "$port" &
pid=$!
trap 'kill -- "-$pid" 2>/dev/null || true; wait "$pid" 2>/dev/null || true' EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

for ((attempt = 0; attempt < 180; attempt++)); do
  if ! kill -0 "$pid" 2>/dev/null; then
    wait "$pid"
    printf 'Preview exited before becoming ready\n' >&2
    exit 1
  fi
  status=$(curl --silent --max-time 2 --output /dev/null --write-out '%{http_code}' "$url") || status=000
  if [[ "$status" == 200 ]]; then
    printf 'Nix preview returned HTTP 200 at %s\n' "$url"
    exit 0
  fi
  sleep 1
done

printf 'Nix preview did not become ready within 180 attempts\n' >&2
exit 1
