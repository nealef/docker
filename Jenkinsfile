node {
    def app1
    def app2
    def app3
    def app5
    def app6
    def app7
    def app8
    def app9
    def app10
    def app11
    def app12
    def app13
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
        app2 = docker.build("clefos/ansible")
        sh "mv Dockerfile ansible/"

        sh "mv bacula/docker-compose.yml ."
        sh "mv bacula/bacula-db/Dockerfile ."
        app3 = docker.build("clefos/bacula-db")
        sh "mv Dockerfile bacula/bacula-db/"

        sh "mv bacula/bacula-db-data/Dockerfile ."
        app4 = docker.build("clefos/bacula-db-data")
        sh "mv Dockerfile bacula/bacula-db-data/"

        sh "mv bacula/bacula-dir/Dockerfile ."
        sh "cp -r bacula/bacula-dir/configs ."
        sh "cp -r bacula/bacula-dir/scripts ."
        app5 = docker.build("clefos/bacula-dir")
        sh "mv Dockerfile bacula/bacula-dir/"
        sh "rm -R configs"
        sh "rm -R scripts"

        sh "mv bacula/bacula-fd/Dockerfile ."
        sh "cp -r bacula/bacula-fd/configs ."
        sh "cp -r bacula/bacula-fd/scripts ."
        app6 = docker.build("clefos/bacula-fd")
        sh "mv Dockerfile bacula/bacula-fd/"
        sh "rm -R configs"
        sh "rm -R scripts"

        sh "mv bacula/bacula-sd/Dockerfile ."
        sh "cp -r bacula/bacula-sd/configs ."
        sh "cp -r bacula/bacula-sd/scripts ."
        app7 = docker.build("clefos/bacula-sd")
        sh "mv Dockerfile bacula/bacula-sd/"
        sh "rm -R configs"
        sh "rm -R scripts"
        sh "mv docker-compose.yml bacula/"

        sh "cp -r bind/container-image-root ."
        sh "mv bind/Dockerfile ."
        app8 = docker.build("clefos/bind")
        sh "rm -R container-image-root"
        sh "mv Dockerfile bind/"

        sh "./busybox/build.sh"
        sh "mv busybox/glibc/Dockerfile ."
        sh "mv busybox/glibc/busybox.tar.xz ."
        app9 = docker.build("clefos/glibc-test")
        sh "mv Dockerfile busybox/glibc/"
        sh "mv busybox.tar.xz busybox/glibc/"

        sh "mv cobol/Dockerfile ."
        app10 = docker.build("clefos/cobol")
        sh "mv Dockerfile cobol/"

        sh "cp -r compose-ui/files ."
        sh "mv compose-ui/Dockerfile ."
        app11 = docker.build("clefos/compose-ui")
        sh "rm -R files"
        sh "mv Dockerfile compose-ui/"

        sh "mv couchdb/install.sh ."
        sh "mv couchdb/Dockerfile ."
        app12 = docker.build("clefos/couchdb")
        sh "mv install.sh couchdb/"
        sh "mv Dockerfile couchdb/"

        sh "mv django/Dockerfile ."
        app13 = docker.build("clefos/django")
        sh "mv Dockerfile django/"
    }
}