node {
    def mvnHome = tool name: 'Maven', type: 'maven'

    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
            withEnv(["HOME=/root"]) {
                sh "${mvnHome}/bin/mvn -B -DskipTests clean package"
            }
        }
    }

    stage('Test') {
        docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
            withEnv(["HOME=/root"]) {
                sh "${mvnHome}/bin/mvn test"
            }
        }
        post {
            always {
                junit 'target/surefire-reports/*.xml'
            }
        }
    }

    stage('Deliver') {
        docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
            withEnv(["HOME=/root"]) {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
