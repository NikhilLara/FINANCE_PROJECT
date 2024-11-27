pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M2" and add it to the path.
        maven "M2_HOME"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/NikhilLara/FINANCE_PROJECT.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                    }
                }
        stage('Generate Test Reports') {
            steps {
               publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Finance/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
                    }
                }
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t nikhillara1989/finance_project:1.0 .'
            }
               }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-login', passwordVariable: 'dockerpassword', usernameVariable: 'dockerlogin')]) {
    // some block
                }
                        }
                               }     
}
}
    
