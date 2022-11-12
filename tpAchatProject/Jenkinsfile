pipeline {
            agent any
            stages {
            
                stage('MVN Clean') {
                    steps {
                        dir('Spring/tpAchatProject') {
                            sh """mvn clean install -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('MVN Compile') {
                    steps {
                        dir('Spring/tpAchatProject') {
                            sh """mvn compile -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('MVN Test') {
                    steps {
                        dir('Spring/tpAchatProject') {
                            sh """mvn test -Drevision=${env.BUILD_NUMBER}"""
                        }
                    }
                }
                stage('Sonar'){
                    steps{
                        dir('Spring/tpAchatProject') {
                            sh """mvn sonar:sonar -Dsonar.projectKey=abir -Dsonar.host.url=http://172.10.0.140:9000 -Dsonar.login=782e4bbb0ba59fe8f9e07013adc73568501e4529"""
                        }
                    }
                }
                stage('Nexus'){
                    steps{
                        dir('Spring/tpAchatProject') {
                            sh """mvn clean package deploy:deploy-file -DgroupId=com.esprit.examen -DartifactId=tpAchatProject -Dversion=1.${env.BUILD_NUMBER} -DgeneratePom=true -Dpackaging=jar -DrepositoryId=deploymentRepo -Durl=http://172.10.0.55:8081/repository/maven-releases/ -Dfile=target/tpAchatProject-1.${env.BUILD_NUMBER}.jar -Drevision=${env.BUILD_NUMBER}"""
                                }
                            }
                        }
                       
                }
                }