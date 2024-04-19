pipeline {
    agent { label 'agent1' }
    stages {
        stage('SonarQube analysis') {
            steps {
                script {
                    sh 'mvn clean'
                    sh 'mvn compile sonar:sonar -Dsonar.host.url=https://sonarcloud.io/ -Dsonar.organization=deployapp -Dsonar.projectKey=deployapp_newdeployapp -Dsonar.login=8578ac26a6e0c5334ec207b57b139ae14b56e9d4'
                }
            }
        }
        stage('Build Artifact') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }
        stage('deploy Artifact') {
            steps {
                sh 'mvn deploy -DskipTests' 
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    sh 'docker build -t app-container .'
                }
            }
        }
        stage('Run Docker image') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
