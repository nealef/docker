node {
    def app1
    stage('Clone Repository') {
        checkout scm
    }

    stage('Build image') {
        DOCKER_HOME = tool "docker"
        sh "mv ade/cfg_files ."
        sh "mv ade/Dockerfile ."
        sh "mv ade/VERSION ."
        app = docker.build("clefos/ade")
        sh "mv cfg_files ade/"
        sh "mv Dockerfile ade/"
        sh "mv VERSION ade/"
    }
}