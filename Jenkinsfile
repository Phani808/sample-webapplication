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
        stage('upload artifact') {
            steps{
               nexusArtifactUploader artifacts: [[artifactId: 'WebApp', classifier: '', file: 'target/WebApp.war', type: 'war']], credentialsId: 'nexus_id', groupId: 'lu.amazon.aws.demo', nexusUrl: 'http://44.197.218.164:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'phani-snapshot', version: '1.0-SNAPSHOT'
        }
    }
}
