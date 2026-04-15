pipeline
{
	agent any
	tools
	{
	    maven 'maven399'
	}
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git url: 'https://github.com/RAJ1005/java-repo.git',
				branch: 'main'
			}
		}
		
		stage('Compile')
		{
			steps
			{
				sh 'mvn compile'
			}
		}

		stage('Test')
		{
			steps
			{
				sh 'mvn test'
			}
		}

		stage('Build')
		{
			steps
			{
				sh 'mvn package'
			}
		}
		
		stage('Build Docker Image')
		{
			steps
			{
			    sh 'cd /var/lib/jenkins/workspace/$JOB_NAME/'
			    sh 'cp /var/lib/jenkins/workspace/$JOB_NAME/target/addressbook.war /var/lib/jenkins/workspace/$JOB_NAME/'
				sh 'docker build -t addressbook:$BUILD_NUMBER .'
				sh 'docker tag addressbook:$BUILD_NUMBER rajkumar1005/addressbook:$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{ 
			steps
			{   
                withDockerRegistry([ credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/' ]) 
                {
                sh 'docker push rajkumar1005/addressbook:$BUILD_NUMBER'
                }
			}
		}

		stage('Deploy as container')
		{
			steps
			{
				sh 'docker service rm address1'
				sh 'docker service create --name address1 -p 31000:8080 --replicas=4 rajkumar1005/addressbook:$BUILD_NUMBER'
			}
		}   
	}
		
}
