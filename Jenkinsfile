
pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/kkarthee/kar_govtec.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("kkarthee/gtweb:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    
      steps("Deploy App") {
        sshagent(credentials : ['sshauth']) {
            sh 'ssh -o StrictHostKeyChecking=no user@hostname.com uptime'
            sh 'ssh -v StrictHostKeyChecking=no root@192.168.5.30 uptime'
            sh 'scp gtweb.yaml root@192.168.5.30:/home/developer/base'
         }
      }
    }
  }
