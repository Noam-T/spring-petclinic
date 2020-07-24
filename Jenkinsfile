pipeline {
    agent {
        docker {
            image 'maven:3.5-jdk-8-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
       stage('SonarQube analysis') {
            steps {
                docker.image('newtmitch/sonar-scanner').inside('-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""') {
                   sh "sonar-scanner -Dsonar.projectBaseDir=./target -Dsonar.host.url='http://130.61.159.221:9000'"
                }
            }
       }
  }

}
