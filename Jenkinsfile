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
        try {
            docker.image('maven:3.9.2').inside('--user root -v $HOME/.m2:/root/.m2') {
                withEnv(["HOME=/root"]) {
                    sh 'mvn test'
                }
            }
        } catch (Exception e) {
            echo "Tests failed, but continuing pipeline..."
        } finally {
            // Mengarsipkan laporan test meskipun ada kegagalan
            archiveArtifacts artifacts: 'target/surefire-reports/*.xml', fingerprint: true
            junit 'target/surefire-reports/*.xml'
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
