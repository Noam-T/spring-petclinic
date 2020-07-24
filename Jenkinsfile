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
    }
    stage('SonarQube analysis') {
       withSonarQubeEnv(credentialsId: 'sonar', installationName: 'Sonar') {
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
    }
  }
}