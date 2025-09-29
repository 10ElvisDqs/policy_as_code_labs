#!/bin/bash
set -e
OUTPUT_DIR="sbom"
mkdir -p $OUTPUT_DIR

echo "🔍 Ejecutando Conftest sobre deployment-insecure.yaml..."
conftest test manifests/deployment-insecure.yaml --policy policies --output json > $OUTPUT_DIR/report_conftest_insecure.json

echo "🔍 Ejecutando Conftest sobre deployment-secure.yaml..."
conftest test manifests/deployment-secure.yaml --policy policies --output json > $OUTPUT_DIR/report_conftest_secure.json

echo "✅ Reportes generados en $OUTPUT_DIR/"
