pipeline {
    agent none
	 
 stages {
      stage('checkout') {
	      parallel{
		      stage('master chkout') {
	      agent {label 'master'}
           steps {             
                git branch: 'master', url: 'https://github.com/karunadm/hello-world-war.git'             
          }
        }  
	stage('slave chkout') {
	      agent {label 'slave1'}
           steps {             
                git branch: 'master', url: 'https://github.com/karunadm/hello-world-war.git'             
          }
        }       
	      }
      }
  stage('Docker Build and Tag') {
	  	    agent {label 'master'}
           steps {  
		 
                sh 'sudo docker build -t sampletest:new1 .' 
                sh 'sudo docker tag sampletest:new1 dmkaruna/testkrepo:new1' 
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
		  stage('slave run') {
			  agent {label 'slave1'}
           steps {
	    	//sh "sudo docker pull dmkaruna/testkrepo:new1"
                sh "sudo docker run -d -p 8888:8080 dmkaruna/testkrepo:new1"
             }
        }
	stage('master run') {
	  agent {label 'master'}
           steps {
	    
                sh "sudo docker run -d -p 8888:8080 dmkaruna/testkrepo:new1"
             }
	}
    }
  }
 }
}
