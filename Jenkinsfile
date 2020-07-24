pipeline {
  agent none
    stages {
        stage('Build') { 
            agent {
                docker {
                   image 'maven:3.5-jdk-8-alpine' 
                   args '-v /root/.m2:/root/.m2' 
                }
            }
	        steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
	    stage('SonarQube analysis') {
            agent {
                docker {
                   image 'newtmitch/sonar-scanner' 
                   args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""' 
                }
            }
            steps {
                   sh "sonar-scanner -Dsonar.projectBaseDir=/var/jenkins_home/workspace/spring-petclinic/target -Dsonar.host.url='http://130.61.159.221:9000'"
            }
       }
   }
}
