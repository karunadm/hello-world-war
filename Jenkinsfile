pipeline {
    agent any
    parameters {
        choice (name: 'choices', choices: ['tester', 'developer'])
            }
    stages {
        stage('Checkout') {
            steps {https://github.com/karunadm/hello-world-war
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/karunadm/hello-world-war.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        
    }
}
