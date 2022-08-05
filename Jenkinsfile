pipeline {
    agent none
	 
 stages {
      stage('checkout') {
	      agent {label 'master'}
           steps {             
                git branch: 'master', url: 'https://github.com/karunadm/hello-world-war.git'             
          }
        }       

  stage('Docker Build and Tag') {
	  parallel{
		  stage('master build'){
	    agent {label 'master'}
           steps {  
		 
                sh 'sudo docker build -t sampletest:new1 .' 
                sh 'sudo docker tag sampletest:new1 dmkaruna/testkrepo:new1' 
            }
		  }
		  stage('slave build'){
	  agent {label 'slave1'}
           steps {  
		 
                sh 'sudo docker build -t sampletest:new1 .' 
                sh 'sudo docker tag sampletest:new1 dmkaruna/testkrepo:new1' 
            }
	 }
    }
  }

stage('Login to Docker hub') {
	agent {label 'master'}
           steps {
              
                sh 'sudo docker login --username=dmkaruna --password=Karuna@09'
          }
        }
     
  stage('Publish image to Docker Hub') {
          agent {label 'master'}
            steps {
       	  sh  'sudo docker push dmkaruna/testkrepo:new1'  
        }                 
          
        }     
   stage('Run Docker container on Jenkins Agent') {
	      parallel {
		  stage('slave1 run') {
			  agent {label 'slave1'}
           steps {
	    
                sh "sudo docker run -d -p 8088:8080 dmkaruna/testkrepo:new1"
             }
        }
	stage('master run') {
	  agent {label 'master'}
           steps {
	    
                sh "sudo docker run -d -p 8088:8080 dmkaruna/testkrepo:new1"
             }
	}
    }
  }
 }
}
