pipeline {
    agent any

    environment {
        GIT_URL = 'https://github.com/10ElvisDqs/policy_as_code_labs.git'
        GIT_CREDENTIALS = 'git-credentials' 
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning repository..."
                git branch: 'main',
                    credentialsId: "${GIT_CREDENTIALS}",
                    url: "${GIT_URL}"
            }
        }

        stage('Policy Check - Conftest') {
            steps {
                echo 'Running Conftest in Docker...'
                sh """
                docker run --rm \
                -v ${WORKSPACE}:/project:rw \
                -w /project openpolicyagent/conftest test \
                --no-fail \
                --policy lab1-conftest/policies \
                lab1-conftest/manifests/deployment-insecure.yaml
                """
            }
        }

        stage('Policy Check - Checkov') {
            steps {
                echo "Running Checkov in Docker..."
                sh '''
                    docker run --rm \
                        -v ${PWD}:/project \
                        -w /project \
                        bridgecrew/checkov \
                        -d lab2-checkov/terraform || true
                '''
            }
        }
    }

    post {
        always {
            echo 'Policy checks completed'
        }
    }
}
