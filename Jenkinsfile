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
                // Use 'bat' for Windows compatibility
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Data Preprocessing') {
            steps {
                echo "Running data preprocessing..."
                bat 'python data_preprocessing.py'
            }
        }

        stage('Train Model') {
            steps {
                echo "Training the model..."
                bat 'python train_model.py'
            }
        }

        stage('Test Model') {
            steps {
                echo "Testing the model..."
                bat 'python test_model.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat 'docker build -t travel-price-prediction .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Deploying the application via Docker..."
                // Stop and remove the old container if it exists
                bat 'docker stop travel-price-container || exit 0 && docker rm travel-price-container || exit 0'
                
                // Run the new container
                bat 'docker run -d --name travel-price-container -p 5000:5000 travel-price-prediction'
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
