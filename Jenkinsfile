pipeline {
    agent any

    stages {
        stage('Repo cloning') {
            steps {
              git 'https://github.com/Phani808/sample-webapplication.git'
            }
        }
        stage('maven build') {
        steps{    
            sh 'mvn clean package'
            }
        }
        stage('code analysis') {
            steps {
                withSonarQubeEnv('mysonar') { 
                    sh "mvn sonar:sonar"
                }
            }
        }
            
        }
}
