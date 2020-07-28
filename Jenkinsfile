pipeline {

    agent any

    stages {

        stage('New Image') {

                steps {
                    sh 'chmod +x ./scripts/*.sh'
                    sh './scripts/newimagebuild.sh'
                }
        }

        stage('Build Images') {

                steps {
 
                    sh './scripts/build_images.sh'
                    
                }
            
        }

        stage('Start Swarm') {

                steps {

                    sh './scripts/swarm_setup.sh'
                
                }

        }

        stage('Deploy Stack') {

                steps {

                    sh './scripts/deploy_stack.sh'


                }
        }

    }

}