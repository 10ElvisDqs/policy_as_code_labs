#!/bin/bash
set -euo pipefail
echo "[*] Running Checkov against terraform/ folder"
checkov -d terraform
exit $?
