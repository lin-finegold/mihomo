#!/usr/bin/env bash
set -euo pipefail
SRC=/tmp/mihomo-linown-1
OUT="$GITHUB_WORKSPACE/dist/linown-1"
rm -rf "$SRC" "$OUT"
git clone --depth 1 --branch Meta https://github.com/MetaCubeX/mihomo.git "$SRC"
mkdir -p "$OUT"
git -C "$SRC" rev-parse HEAD > "$OUT/UPSTREAM_COMMIT.txt"
python3 - <<'PY'
from pathlib import Path
p=Path('/tmp/mihomo-linown-1/component/tls/reality.go')
s=p.read_text()
a='const RealityMaxShortIDLen = 8'
b='const RealityMaxShortIDLen = 8\n\n// REALITY