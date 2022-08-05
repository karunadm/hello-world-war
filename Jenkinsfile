pipeline {
    agent any	
	 
 stages {
      stage('checkout') {
           steps {             
                git branch: 'master', url: 'https://github.com/karunadm/hello-world-war.git'             
          }
        }       

  stage('Docker Build and Tag') {
	  parallel {
		  stage('slave1 build') {
			  agent {label 'slave1'}
           steps {  
		 
                sh 'sudo docker build -t sampletest:latest .' 
                sh 'sudo docker tag sampletest dmkaruna/testkrepo:latest' 
            }
	}
	stage('master build') {
			  agent {label 'master'}
           steps {  
		 
                sh 'sudo docker build -t sampletest:latest .' 
                sh 'sudo docker tag sampletest dmkaruna/testkrepo:latest' 
            }
	 }	  
	}	  
      }

stage('Login to Docker hub') {
           steps {
              
                sh 'sudo docker login --username=dmkaruna --password=Karuna@09'
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
       	  sh  'sudo docker push dmkaruna/testkrepo:latest'  
        }                 
          
        }     
   stage('Run Docker container on Jenkins Agent') {
	      parallel {
		  stage('slave1 run') {
			  agent {label 'slave1'}
           steps {
	    
                sh "sudo docker run -d -p 8004:8080 dmkaruna/testkrepo:latest"
             }
        }
	stage('master run') {
	  agent {label 'master'}
           steps {
	    
                sh "sudo docker run -d -p 8004:8080 dmkaruna/testkrepo:latest"
             }
	}
    }
  }
 }
}
