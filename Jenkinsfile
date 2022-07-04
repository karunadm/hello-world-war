pipeline {
    agent any
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
        stage('Deploy') {
            steps {
                sh 'sudo cp /home/slave1/workspace/test1/target/hello-world-war-1.0.0.war /opt/apache-tomcat-9.0.64/webapps/hello-world-pipeline.war'
            }
        }
    }
}
