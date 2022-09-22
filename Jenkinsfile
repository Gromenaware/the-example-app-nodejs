pipeline {
    agent {
     label "Agent2SSH" //This agent needs to run docker natively
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/Gromenaware/the-example-app-nodejs.git'
            }
            
        }
        stage('Clean') {
            steps {
                // Clean older deployments and images to build another from scratch
                sh 'docker stop the-example-app'
                sh 'docker rm the-example-app'
            }
        }
        stage('Build') {
            steps {
                // Build image from scratch
                sh 'docker build -t the-example-app.nodejs .' 
            }
        }
        stage('Deployment') {
            steps {
                // Deploy image already created
                sh 'docker run -p 3000:3000 --name the-example-app -d the-example-app.nodejs'
            }
        }  
    }
}