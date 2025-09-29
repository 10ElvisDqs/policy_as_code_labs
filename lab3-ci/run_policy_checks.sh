#!/bin/bash
set -euo pipefail
echo "[*] Running policy checks locally (Conftest + Checkov)"
conftest test --policy lab1-conftest/policies lab1-conftest/manifests/deployment-insecure.yaml || true
checkov -d lab2-checkov/terraform || true
echo "[*] Done. Inspect outputs above."
