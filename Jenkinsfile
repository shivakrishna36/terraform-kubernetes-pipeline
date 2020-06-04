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
					
					
					script {
  						try {
      							sh 'terraform --version'
							sh 'terraform init'
							sh 'terraform plan'
							sh 'terraform apply -auto-approve'
							sh 'terraform output kubeconfig>~/.kube/config'
							
							sh 'aws eks --region us-east-1 update-kubeconfig --name terraform-eks-demo'
							sh 'terraform output config_map_aws_auth > configmap.yml'
							sh 'kubectl apply -f configmap.yml'
							
							sh 'kubectl create -f deploy1.yml'
							sh 'kubectl create -f service1.yml'
							timeout(5) {
								input('proceed')
							sh 'terraform destroy -auto-approve'
								}
  						} catch (Exception e) {
      							sh 'terraform destroy -auto-approve'
  						}
						}
					
					
                  			
					
                  			}
               			}
            		}
		
	 	}
}
