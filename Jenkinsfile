pipeline {
	agent any
	tools {
        maven 'maven3.6.3'
        jdk 'jdk8'
	terraform 'terraform'

    	}
	
         stages {
            /*     stage('One') {
                 steps {
			  
			sh label: '', script: 'java -version'
                     echo 'Hi, this is jenkins pipeline'
                 }
                 }
		 
		stage ('Build') {
            		steps {
                		sh label: '', script: 'mvn clean package'
				echo 'build success'
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
		 */
		stage('eks-cluster-creation') {
            		steps {
               			dir('./terraform') {
                  			/*sh 'terraform --version'
					sh 'terraform init'
					sh 'terraform plan'
					sh 'terraform apply -auto-approve'*/
					sh 'aws eks --region us-east-1 update-kubeconfig --name terraform-eks-demo'
					sh 'kubectl get svc'
					sh 'terraform destroy -auto-approve'
                  			}
               			}
            		}
		
	 	}
}
