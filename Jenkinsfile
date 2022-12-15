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
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t phani997/webapp .'
                }
            }
        }
        stage('Push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerhub')]) {
                    sh 'docker login -u phani997 -p ${dockerhub}'
                    }
                  sh 'docker push phani997/webapp'
                }
            }
        }
        stage('Deploy to K8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'kubeconfig')
                }
            }
        }
   }   }    