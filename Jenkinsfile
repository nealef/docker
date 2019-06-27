node {
    def app1
    def app2
    stage('Clone Repository') {
        checkout scm
    }

    stage('Build image') {
        DOCKER_HOME = tool "docker"
        sh "cp -r ade/cfg_files ."
        sh "mv ade/Dockerfile ."
        sh "mv ade/VERSION ."
        app1 = docker.build("clefos/ade")
        sh "rm -R cfg_files/"
        sh "mv Dockerfile ade/"
        sh "mv VERSION ade/"
        
        sh "cp -r AMHub/AMHub_Files ."
        sh "mv AMHub/Dockerfile ."
        app2 = docker.build("clefos/amhub")
        sh "mv Dockerfile AMHub/"
        sh "rm -R AMHub_Files/"
    }
}