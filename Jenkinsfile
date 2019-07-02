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
    def app14
    def app15
    def app16
    def app17
    def app18
    def app19
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

        sh "cp -r docker-swarm-visualizer/files ."
        sh "mv docker-swarm-visualizer/package.json ."
        sh "mv docker-swarm-visualizer/Dockerfile ."
        app14 = docker.build("clefos/visualizer")
        sh "rm -R files"
        sh "mv package.json docker-swarm-visualizer/"
        sh "mv Dockerfile docker-swarm-visualizer/"

        sh "mv earthquake/Dockerfile ."
        app15 = docker.build("clefos/earthquake")
        sh "mv Dockerfile earthquake/"

        sh "mv erlang/Dockerfile ."
        app16 = docker.build("clefos/erlang")
        sh "mv Dockerfile erlang/"

        sh "mv etcd/Dockerfile ."
        sh "mv etcd/etcd-s390x.patch ."
        app17 = docker.build("clefos/etcd")
        sh "mv Dockerfile etcd/"
        sh "mv etcd-s390x.patch etcd/"

        sh "mv fluentd/Dockerfile ."
        app18 = docker.build("clefos/fluentd")
        sh "mv Dockerfile fluentd/"

        sh "mv golang/Dockerfile ."
        sh "mv golang/go-wrapper ."
        app19 = docker.build("clefos/golang")
        sh "mv Dockerfile golang/"
        sh "mv go-wrapper golang/"


    }
    stage('Cleanup'){
        sh "docker ps -a | grep -E “Exit|Creat” | awk ‘{print $1}’ | xargs docker rm"
        sh "docker images | grep none | awk ‘{print $3}’ | sort -u | xargs docker rmi"
    }
}