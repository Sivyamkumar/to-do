pipeline {
    agent any

    environment {
        APP_NAME   = "todo-app"
        IMAGE_NAME = "todo-app-image"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop ${APP_NAME} || true
                docker rm ${APP_NAME} || true
                docker run -d \
                  --name ${APP_NAME} \
                  -p 3000:3000 \
                  ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Application built and deployed successfully"
        }
        failure {
            echo "❌ Deployment failed"
        }
    }
}
