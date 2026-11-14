
pipeline {
    agent any

environment {
    APP_NAME = 'my-java-app'
    APP_ENV = 'staging'
}
    stages {

        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'echo Application build completed!'
            }
        }
stage('Environment Info') {
    steps {
        echo "Build Number: ${env.BUILD_NUMBER}"
        echo "Job Name: ${env.JOB_NAME}"
        echo "Workspace: ${env.WORKSPACE}"

        sh 'echo "Current directory:"'
        sh 'pwd'

        sh 'echo "Workspace contents:"'
        sh 'ls -la'
echo "Application: ${env.APP_NAME}"
echo "Deployment Environment: ${env.APP_ENV}"
    }
}
        stage('Test') {
            steps {
                echo 'Running application tests...'
                sh 'echo All tests passed!'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh 'echo Application deployed successfully!'
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Please check the logs.'
        }

        always {
            echo 'Pipeline execution finished.'
        }
    }
}

