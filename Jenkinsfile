node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
            withEnv(["HOME=/root"]) {
                sh 'mvn -B -DskipTests clean package'
            }
        }
    }

    stage('Test') {
        docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
            withEnv(["HOME=/root"]) {
                sh 'mvn test'
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
