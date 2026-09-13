#!/usr/bin/env bash
set -euo pipefail

appium_url="${APPIUM_URL:-http://127.0.0.1:4723}"
timeout_seconds="${TIMEOUT_SECONDS:-300}"
deadline=$((SECONDS + timeout_seconds))

until curl --fail --silent "${appium_url}/status" >/dev/null \
  || curl --fail --silent "${appium_url}/wd/hub/status" >/dev/null; do
  if (( SECONDS >= deadline )); then
    echo "ERROR: Appium did not become ready within ${timeout_seconds}s." >&2
    exit 1
  fi
  sleep 5
done

echo "Appium is ready at ${appium_url}."
