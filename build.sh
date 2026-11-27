#!/bin/bash
set -euo pipefail

if [[ -z "${THEOS:-}" ]]; then
  export THEOS="$HOME/theos"
fi
if [[ ! -f "$THEOS/makefiles/common.mk" ]]; then
  echo "Theos not found. Set THEOS or install Theos at ~/theos." >&2
  exit 1
fi

make clean
make package FINALPACKAGE=1

PACKAGE=$(find packages -maxdepth 1 -type f \( -name '*.deb' -o -name '*.dylib' \) | sort | tail -n 1)
if [[ -z "$PACKAGE" ]]; then
  echo "Build finished but no package was found in ./packages" >&2
  exit 1
fi

echo "Build successful: $PACKAGE"
