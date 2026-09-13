#!/usr/bin/env bash
set -euo pipefail

if [[ ! -e /dev/kvm ]]; then
  echo "ERROR: /dev/kvm is missing. Enable KVM or nested virtualization on this node." >&2
  exit 1
fi

if [[ ! -r /dev/kvm || ! -w /dev/kvm ]]; then
  echo "ERROR: /dev/kvm exists but is not readable and writable by the current user." >&2
  exit 1
fi

echo "KVM is available."
