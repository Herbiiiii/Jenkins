pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/dotnet/sdk:6.0'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout the code from the repository
                    checkout scm

                    // Build the project
                    sh 'dotnet publish -c Release -o out'
                }
            }
            post {
                success {
                    // Archive the built artifacts
                    archiveArtifacts artifacts: 'out/**/*', allowEmptyArchive: true
                }
            }
        }
    }
}