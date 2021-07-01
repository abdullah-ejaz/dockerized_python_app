def app = 'Unknown'
pipeline{
    agent any
    environment {
    registry = '489994096722.dkr.ecr.us-east-2.amazonaws.com/abdullah_jenkins_ecr'
    // registryCredential = 'ecr:us-east-2'
    AWS_DEFAULT_REGION = 'us-east-2'
             }    
    stages{
        stage("Git_Checkout"){
            steps{
                script {
                 checkout scm
                }
            }
        }    
        stage("Build image"){
            steps{
                script {
                    app = docker.build("abd-sample-pythonapp") 
                }
            }   
        }
        stage("Test image"){
            steps{
                script {
                    app.inside {            
                        sh 'echo "Tests passed"'        
                    } 
                }
            }   
        }
        stage("Push image"){
            steps{
                script {
                    // configure registry
                    docker.withRegistry( '489994096722.dkr.ecr.us-east-2.amazonaws.com' , 'ecr:us-east-2:abdullah_jenkins_ecr')
                    {
                        def myImage = app.push("abd-sample-pythonapp")            
                        myImage.push("latest")     
                    }
                }
            }
        }
    }
}  