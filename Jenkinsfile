pipeline {
	agent any
	tools {
        maven 'maven3.6.3'
        jdk 'jdk8'

    	}
	environment {
		
		PATH = "C:\\WINDOWS\\SYSTEM32"
	    	scannerHome = tool 'sonarcube scanner'
		
		/*registry = "shivakrishna1236/pipeline"
   		registryCredential = 'dockerhub'
		dockerImage = ''*/
	}
         stages {
                 stage('One') {
                 steps {
			  
			sh label: '', script: 'java -version'
                     echo 'Hi, this is jenkins pipeline'
                 }
                 }
		  
		stage ('parallel') {
			 
		 		parallel {
					stage ('Build') {
            					steps {
                					bat label: '', script: 'mvn clean package'
							echo 'build success'
           	 				}
		 			}
		 			stage('Sonarqube') {
			 			steps {
							bat 'mvn sonar:sonar'
							echo 'sonarqube success'
			 			}
					}
		 
		 
		 			
		 		}
		 	
		 }
		 stage ('deploy in cointainer1') {
			 steps {
				 deploy adapters: [tomcat8(credentialsId: '702722ae-4842-40e4-b6f4-6ada448a3cd6', path: '', url: 'http://localhost:8088/')], contextPath: 'webapp', onFailure: false, war: '**/*.war'
			 }
		 }
		 
		 stage ('continue?') {
			 steps {
				 timeout(time: 10, unit: 'SECONDS') {
    					input('do you want to proceed')
				}
			 }
		 }
		 
		  stage ('deploy in cointainer2') {
			 steps {
				 deploy adapters: [tomcat9(credentialsId: '702722ae-4842-40e4-b6f4-6ada448a3cd6', path: '', url: 'http://localhost:8089/')], contextPath: 'webapp', onFailure: false, war: '**/*.war'
			 }
		 }
		
		 stage ('building docker image') {
			 
					 
			 steps{
      				sh 'docker build . -t shivakrishna1236/pipeline'
    			}
				 
			 
		 }
		 stage('Deploy Image') {
 		 	steps{
    				withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerpwd', usernameVariable: 'dockername')]) {
    					sh "docker login -u ${env.dockername} -p ${env.dockerpwd}"
					sh 'docker push shivakrishna1236/pipeline:latest'
				}
  			}
		}
		 
		
		
	 	}
}
