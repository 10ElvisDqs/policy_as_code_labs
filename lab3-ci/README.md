Lab 3 - Integración en CI/CD (Jenkins)
=====================================

Objetivo:
 - Integrar Policy as Code en un pipeline Jenkins (o ejecutar localmente).

Contenido:
 - docker-compose-jenkins.yml (levanta Jenkins con acceso a docker.sock)
 - Jenkinsfile (pipeline ejemplo que ejecuta Conftest y Checkov)
 - run_policy_checks.sh (script para ejecutar localmente)

Pasos rápidos (local):
1. Asegúrate de tener conftest y checkov instalados.
2. Ejecuta localmente:
   chmod +x run_policy_checks.sh
   ./run_policy_checks.sh
3. Para la integración en Jenkins:
   - Levanta Jenkins con docker-compose: docker-compose -f docker-compose-jenkins.yml up -d
   - Crea un pipeline que apunte al Jenkinsfile incluido (o pega su contenido).

Notas:
 - Jenkins container tiene acceso al socket Docker; puedes configurar agentes Docker para builds.
 - En entornos corporativos, protege el acceso al socket y usa agentes dedicados.
