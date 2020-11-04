
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
    
      stage("Deploy App") {
        steps {
        sshagent(credentials : ['sshauth']) {
            sh 'ssh -o StrictHostKeyChecking=no root@192.168.5.30 uptime'
            sh 'ssh -v root@192.168.5.30'
            sh 'scp getweb_deploy.yaml root@192.168.5.30:/home/developer/base'
            sh 'ssh -o StrictHostKeyChecking=no root@192.168.5.30 kubectl apply -f /home/developer/base/getweb_deploy.yaml -n jenkins'
            sh 'ssh -o StrictHostKeyChecking=no root@192.168.5.30  kubectl rollout restart deployment myapp-deployment -n jenkins'
         }
      }
    }
  }
}
