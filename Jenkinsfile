pipeline {
    agent {
            label "docker && linux"
    } 

    environment {
        VERSION = vault path: "DevOps/RELEASE_VERSIONS", key: 'SONAR'
        BSL_PLUGIN_VERSION = vault path: "DevOps/RELEASE_VERSIONS", key: 'SONAR_BSL_PLUGIN'
        BRANCH_PLUGIN = vault path: "DevOps/RELEASE_VERSIONS", key: 'SONAR_BRANCH_PLUGIN'
    }

    options { 
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 10, unit: 'MINUTES')
        timestamps() 
    }
    stages {
        stage('Build image') {
            steps {           
                script{
                    def secrets = [
                    [path: "infastructure/gitlab", engineVersion: 2, secretValues: [
                        [envVar: 'CI_BOT_TOKEN', vaultKey: 'ci-bot']
                    ]]
                ]           
                    withVault([configuration: [timeout: 60], vaultSecrets: secrets ]){ 
                        sh "docker login -u ci-bot -p ${CI_BOT_TOKEN} registry.oskk.1solution.ru"
                        sh """
                                docker build -t registry.oskk.1solution.ru/docker-images/sonarqube-bsl:${VERSION}-${BSL_PLUGIN_VERSION} \
                                --build-arg VERSION=${VERSION} --build-arg BSL_PLUGIN_VERSION=${BSL_PLUGIN_VERSION} \
                                --build-arg BRANCH_PLUGIN=${BRANCH_PLUGIN} .
                            """
                        sh "docker push registry.oskk.1solution.ru/docker-images/sonarqube-bsl:${VERSION}-${BSL_PLUGIN_VERSION}"
                    }
                }            
            }
        }
    }
}
