pipeline {
    agent any
 
   stages {
      
       stage('checkout') {
           steps {             
                git branch: 'master', url: 'https://github.com/karunadm/hello-world-war.git'             
          }
        }       

       stage('Docker Build and Tag') {
           steps {
              
                //sh 'cd /home/ubuntu/hello-world-war'
                sh 'sudo docker build -t samplecicd:latest .' 
                sh 'sudo docker tag samplecicd dmkaruna/testkrepo:latest'
                              
          }
        }
       
       stage('Login to Docker hub') {
           steps {
              
                sh 'sudo docker login --username=dmkaruna --password=Karuna@06'
           }
       }
     
      stage('Publish image to Docker Hub') {
          
            steps {
          //withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'sudo docker push dmkaruna/testkrepo:latest'
                }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                sh "sudo docker run -d -p 8003:8080 dmkaruna/testkrepo"
 
            }
        }
 
    }
 }

