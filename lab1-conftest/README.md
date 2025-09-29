Lab 1 - Conftest + Kubernetes YAML
=================================

Objetivo:
 - Detectar Pods que intentan correr como root (ausencia de securityContext.runAsNonRoot).

Contenido:
 - policies/no-root.rego
 - manifests/deployment-insecure.yaml  (versión insegura)
 - manifests/deployment-secure.yaml    (versión corregida)
 - run_conftest.sh                      (script para ejecutar conftest)

Pasos rápidos:
1. Instalar conftest:
   Linux (ejemplo):
     curl -L -o conftest.tar.gz https://github.com/open-policy-agent/conftest/releases/latest/download/conftest_$(uname -s)_$(uname -m).tar.gz
     tar -xzf conftest.tar.gz
     sudo mv conftest /usr/local/bin/

2. Ejecutar el test:
   chmod +x run_conftest.sh
   ./run_conftest.sh

3. Revisar la salida: conftest devolverá código de salida != 0 si hay violaciones.

4. Corregir manifiesto:
   cp manifests/deployment-secure.yaml manifests/deployment-insecure.yaml
   ./run_conftest.sh  # ahora debería pasar
