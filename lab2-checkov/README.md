Lab 2 - Checkov + Terraform
===========================

Objetivo:
 - Detectar configuraciones inseguras en IaC (ej. buckets S3 sin cifrado).

Contenido:
 - terraform/main.tf (ejemplo inseguro)
 - run_checkov.sh

Pasos rápidos:
1. Instalar Checkov:
   pip install checkov

2. Ejecutar Checkov:
   chmod +x run_checkov.sh
   ./run_checkov.sh

3. Revisar violaciones reportadas por Checkov.
4. (Opcional) Descomentar la sección 'secure_bucket' y volver a ejecutar para ver cambios.
