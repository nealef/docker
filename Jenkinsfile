node {
    def app1
    def app2
    def app3
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

        sh "mv ansible/Dockerfile ."
        app3 = docker.build("clefos/ansible")
        sh "mv Dockerfile ansible/"
    }
}