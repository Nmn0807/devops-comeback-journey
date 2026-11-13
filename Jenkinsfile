
pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'echo Application build completed!'
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
}

