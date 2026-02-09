pipeline {
    agent any

    environment {
        APP_NAME   = "todo-app"
        IMAGE_NAME = "todo-app-image"
        IMAGE_TAG  = "latest"
        NETWORK    = "todo-net"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build --no-cache -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Deploy MongoDB') {
            steps {
                sh """
                docker network create ${NETWORK} || true

                docker stop mongodb || true
                docker rm mongodb || true

                docker run -d \
                  --name mongodb \
                  --network ${NETWORK} \
                  -p 27017:27017 \
                  mongo
                """
            }
        }

        stage('Deploy Application') {
            steps {
                sh """
                docker stop ${APP_NAME} || true
                docker rm ${APP_NAME} || true

                docker run -d \
                  --name ${APP_NAME} \
                  --network ${NETWORK} \
                  -p 3000:3000 \
                  -e DB_URL=mongodb://mongodb:27017/todoapp \
                  ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Application and MongoDB deployed successfully"
        }
        failure {
            echo "❌ Deployment failed"
        }
    }
}
