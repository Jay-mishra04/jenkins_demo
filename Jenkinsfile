pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning the repository..."
                git branch: 'main', url: 'https://github.com/Jay-mishra04/jenkins_demo'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing Python dependencies..."
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Data Preprocessing') {
            steps {
                echo "Running data preprocessing..."
                sh 'python data_preprocessing.py'
            }
        }

        stage('Train Model') {
            steps {
                echo "Training the model..."
                sh 'python train_model.py'
            }
        }

        stage('Test Model') {
            steps {
                echo "Testing the model..."
                sh 'python test_model.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t travel-price-prediction .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Deploying the application via Docker..."
                // Stop the old container if it exists
                sh 'docker stop travel-price-container || true && docker rm travel-price-container || true'
                
                // Run the new container
                sh 'docker run -d --name travel-price-container -p 5000:5000 travel-price-prediction'
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully! Application deployed."
        }
        failure {
            echo "Pipeline failed. Please check the logs for details."
        }
    }
}
