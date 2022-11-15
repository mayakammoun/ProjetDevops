pipeline {
            agent any
            stages {
            
                stage('MVN Clean') {
                    steps {
                        dir('tpAchatProject') {
                            sh """mvn clean install -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('MVN Compile') {
                    steps {
                        dir('tpAchatProject') {
                            sh """mvn compile -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('MVN Test') {
                    steps {
                        dir('tpAchatProject') {
                            sh """mvn test -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('Sonar'){
                    steps{
                        dir('tpAchatProject') {
                            sh """mvn sonar:sonar -Dsonar.projectKey=abir -Dsonar.host.url=http://172.10.0.140:9000 -Dsonar.login=782e4bbb0ba59fe8f9e07013adc73568501e4529"""
                        }
                    }
                }
                stage('Nexus'){
                    steps{
                        dir('tpAchatProject') {
                            sh """mvn clean package deploy:deploy-file -DgroupId=com.esprit.examen -DartifactId=tpAchatProject -Dversion=1.${env.BUILD_NUMBER} -DgeneratePom=true -Dpackaging=jar -DrepositoryId=deploymentRepo -Durl=http://172.10.0.140:8081/repository/maven-releases/ -Dfile=target/tpAchatProject-1.${env.BUILD_NUMBER}.jar -Drevision=${env.BUILD_NUMBER}"""
                                }
                            }
                        }
                         stage('Building Docker Image') {
                    steps {
                        dir('tpAchatProject'){
                            sh 'docker build -t abiiir/tpachat .'
                                }
                            }
                        }
                stage('Login to DockerHub') {
                    steps{
                        dir('tpAchatProject'){
                            sh 'docker login -u abiiir -p 214JFT0824'
                            }
                        }
                    }
                stage('Push to DockerHub') {
                    steps{
                        dir('tpAchatProject'){
                            sh 'docker push abiiir/tpachat'
                             }
                        }
                    }
                stage('Docker Compose'){
                    steps{
                       dir('tpAchatProject'){
                            sh 'docker-compose up -d'
                            }
                       }
                    }
                       
                }
                }
