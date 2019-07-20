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
    def app20
    def app21
    def app22
    def app23
    def app24
    def app25
    def app26
    def app27
    def app28
    def app29
    def app30
    def app31
    def app32
    def app33
    def app34
    def app35
    def app36
    def app37
    def app38
    def app39
    def app40
    def app41
    def app42
    def app43
    def app44
    def app45
    def app46
    def app47
    def app48
    def app49
    def app50
    def app51
    def app52
    def app53
    def app54
    def app55
    def app56
    def app57
    def app58
    def app59
    def app60
    def app61
    def app62
    def app63
    def app64
    def app65
    def app66
    def app67
    def app68
    def app69
    def app70
    def app71
    def app72
    def app73
    def app74
    def app75
    def app76
    def app77
    def app78
    def app79
    def app80
    stage('Clone Repository') {
        checkout scm
    }

    stage('Build image') {
        DOCKER_HOME = tool "docker"
        // sh "./buildall.sh"
        app1 = docker.image("clefos/ade")
        // sh "docker rmi clefos/ade"
        // sh "mv ansible/Dockerfile ."
        app2 = docker.image("clefos/ansible")
        // sh "mv Dockerfile ansible/"
        // sh "docker rmi clefos/ansible"
        // sh "mv bacula/docker-compose.yml ."
        // sh "mv bacula/bacula-db/Dockerfile ."
        app3 = docker.image("clefos/bacula-db")
        // sh "mv Dockerfile bacula/bacula-db/"
        // sh "docker rmi clefos/bacula-db"
        // sh "mv bacula/bacula-db-data/Dockerfile ."
        app4 = docker.image("clefos/bacula-db-data")
        // sh "mv Dockerfile bacula/bacula-db-data/"
        // sh "docker rmi clefos/bacula-db-data"
        // sh "mv bacula/bacula-dir/Dockerfile ."
        // sh "cp -r bacula/bacula-dir/configs ."
        // sh "cp -r bacula/bacula-dir/scripts ."
        app5 = docker.image("clefos/bacula-dir")
        // sh "mv Dockerfile bacula/bacula-dir/"
        // sh "rm -R configs"
        // sh "rm -R scripts"
        // sh "docker rmi clefos/bacula-dir"
        // sh "mv bacula/bacula-fd/Dockerfile ."
        // sh "cp -r bacula/bacula-fd/configs ."
        // sh "cp -r bacula/bacula-fd/scripts ."
        app6 = docker.image("clefos/bacula-fd")
        // sh "mv Dockerfile bacula/bacula-fd/"
        // sh "rm -R configs"
        // sh "rm -R scripts"
        // sh "docker rmi clefos/bacula-fd"
        // sh "mv bacula/bacula-sd/Dockerfile ."
        // sh "cp -r bacula/bacula-sd/configs ."
        // sh "cp -r bacula/bacula-sd/scripts ."
        app7 = docker.image("clefos/bacula-sd")
        // sh "mv Dockerfile bacula/bacula-sd/"
        // sh "rm -R configs"
        // sh "rm -R scripts"
        // sh "mv docker-compose.yml bacula/"
        // sh "docker rmi clefos/bacula-sd"
        // sh "cp -r bind/container-image-root ."
        // sh "mv bind/Dockerfile ."
        app8 = docker.image("clefos/bind")
        // sh "rm -R container-image-root"
        // sh "mv Dockerfile bind/"
        // sh "docker rmi clefos/bind"
        // sh "./busybox/build.sh"
        // sh "mv busybox/glibc/Dockerfile ."
        // sh "mv busybox/glibc/busybox.tar.xz ."
        app9 = docker.image("clefos/glibc-test")
        // sh "mv Dockerfile busybox/glibc/"
        // sh "mv busybox.tar.xz busybox/glibc/"
        // sh "docker rmi clefos/glibc-test"
        // sh "mv cobol/Dockerfile ."
        app10 = docker.image("clefos/cobol")
        // sh "mv Dockerfile cobol/"
        // sh "docker rmi clefos/cobol"
        // sh "cp -r compose-ui/files ."
        // sh "mv compose-ui/Dockerfile ."
        app11 = docker.image("clefos/compose-ui")
        // sh "rm -R files"
        // sh "mv Dockerfile compose-ui/"
        // sh "docker rmi clefos/compose-ui"
        // sh "mv couchdb/install.sh ."
        // sh "mv couchdb/Dockerfile ."
        app12 = docker.image("clefos/couchdb")
        // sh "mv install.sh couchdb/"
        // sh "mv Dockerfile couchdb/"
        // sh "docker rmi clefos/couchdb"
        // sh "mv django/Dockerfile ."
        app13 = docker.image("clefos/django")
        // sh "mv Dockerfile django/"
        // sh "docker rmi clefos/django"
        // sh "cp -r docker-swarm-visualizer/files ."
        // sh "mv docker-swarm-visualizer/package.json ."
        // sh "mv docker-swarm-visualizer/Dockerfile ."
        app14 = docker.image("clefos/visualizer")
        // sh "rm -R files"
        // sh "mv package.json docker-swarm-visualizer/"
        // sh "mv Dockerfile docker-swarm-visualizer/"
        // sh "docker rmi clefos/visualizer"
        // sh "mv earthquake/Dockerfile ."
        app15 = docker.image("clefos/earthquake")
        // sh "mv Dockerfile earthquake/"
        // sh "docker rmi clefos/earthquake"
        // sh "mv erlang/Dockerfile ."
        app16 = docker.image("clefos/erlang")
        // sh "mv Dockerfile erlang/"
        // sh "docker rmi clefos/erlang"
        // sh "mv etcd/Dockerfile ."
        // sh "mv etcd/etcd-s390x.patch ."
        app17 = docker.image("clefos/etcd")
        // sh "mv Dockerfile etcd/"
        // sh "mv etcd-s390x.patch etcd/"
        // sh "docker rmi clefos/etcd"
        // sh "mv fluentd/Dockerfile ."
        app18 = docker.image("clefos/fluentd")
        // sh "mv Dockerfile fluentd/"
        // sh "docker rmi clefos/fluentd"
        // sh "mv golang/Dockerfile ."
        // sh "mv golang/go-wrapper ."
        app19 = docker.image("clefos/golang")
        // sh "mv Dockerfile golang/"
        // sh "mv go-wrapper golang/"
        // sh "docker rmi clefos/golang"
        // sh "cd grafana ; make all"
        app20 = docker.image("clefos/grafana")
        // sh "docker rmi grafana"
        // sh "cp -r hadoop-openshift/bin ."
        // sh "cp -r hadoop-openshift/etc ."
        // sh "mv hadoop-openshift/Dockerfile ."
        // sh "mv hadoop-openshift/hadoop-cluster-template.json ."
        // sh "wget https://archive.apache.org/dist/hadoop/core/hadoop-2.8.1/hadoop-2.8.1.tar.gz"
        app21 = docker.image("clefos/hadoop");
        // sh "rm -R bin"
        // sh "rm -R etc"
        // sh "rm hadoop-2.8.1.tar.gz"
        // sh "mv Dockerfile hadoop-openshift/"
        // sh "mv hadoop-cluster-template.json hadoop-openshift/"
        // sh "docker rmi clefos/hadoop"
        // sh "mv hello-nodejs/Dockerfile ."
        // sh "mv hello-nodejs/index.js ."
        // sh "mv hello-nodejs/package.json ."
        app22 = docker.image("clefos/hello-nodejs")
        // sh "mv Dockerfile hello-nodejs/"
        // sh "mv index.js hello-nodejs/"
        // sh "mv package.json hello-nodejs/"
        // sh "docker rmi clefos/hello-nodejs"
        // sh "mv httpd/Dockerfile ."
        // sh "mv httpd/run-httpd.sh ."
        app23 = docker.image("clefos/httpd");
        // sh "mv Dockerfile httpd/"
        // sh "mv run-httpd.sh httpd/"
        // sh "docker rmi clefos/httpd"
        // sh "cd ibmjava ; make all"
        app24 = docker.image("docker.io/clefos/ibmjava:8")
        app25 = docker.image("docker.io/clefos/ibmjava:8-sdk")
        app26 = docker.image("docker.io/clefos/ibmjava:11-sdk")
        app27 = docker.image("docker.io/clefos/maven:8")
        app28 = docker.image("docker.io/clefos/maven:11")
        app29 = docker.image("docker.io/clefos/ibmjava:8-sfj")
        // sh "docker rmi docker.io/clefos/ibmjava:8"
        // sh "docker rmi docker.io/clefos/ibmjava:8-sdk"
        // sh "docker rmi docker.io/clefos/maven:8"
        // sh "docker rmi docker.io/clefos/maven:11"
        // sh "docker rmi docker.io/clefos/ibmjava:11-sdk"
        // sh "docker rmi docker.io/clefos/ibmjava:8-sfj"
        // sh "mv ibmjava/8/sdk/Dockerfile ."
        app25 = docker.image("clefos/ibmjava:8-sdk")
        // sh "mv Dockerfile ibmjava/8/sdk/"
        // sh "docker rmi clefos/ibmjava:8-sdk"
        // sh "mv ibmjava/8/sfj/Dockerfile ."
        app26 = docker.image("clefos/ibmjava:8-sfj")
        // sh "mv Dockerfile ibmjava/8/sfj/"
        // sh "docker rmi clefos/ibmjava:8-sfj"
        // sh "mv ibmjava/11/sdk/Dockerfile ."
        app27 = docker.image("clefos/ibmjava:11-sdk")
        // sh "mv Dockerfile ibmjava/11/sdk/"
        // sh "docker rmi clefos/ibmjava:11-sdk"
        // sh "mv ibmjava/8/maven/Dockerfile ."
        app28 = docker.image("clefos/maven:8")
        // sh "mv Dockerfile ibmjava/8/maven/"
        // sh "docker rmi clefos/maven:8"
        // sh "mv ibmjava/11/maven/Dockerfile ."
        app29 = docker.image("clefos/maven:11")
        // sh "mv Dockerfile ibmjava/11/maven/"
        // sh "docker rmi clefos/maven:11"
        // sh "cd jboss ; git clone https://github.com/jboss-dockerfiles/wildfly.git ; cd .."
        // sh "cd jboss/wildfly ; git checkout 11.0.0.Final -b s390x ; cd .."
        // sh "mv jboss/wildfly/Dockerfile ."
        app30 = docker.image("clefos/jboss-wildfly")
        // sh "mv Dockerfile jboss/wildfly/"
        // sh "docker rmi clefos/jboss-wildfly"
        // sh "mv jupyter/Dockerfile ."
        app31 = docker.image("clefos/jupyter")
        // sh "mv Dockerfile jupyter/"
        // sh "docker rmi clefos/jupyter"
        // sh "mv kubernetes/Dockerfile ."
        // sh "mv kubernetes/kubernetes.sh ."
        app32 = docker.image("clefos/kubernetes")
        // sh "mv kubernetes.sh kubernetes/"
        // sh "mv Dockerfile kubernetes/"
        // sh "docker rmi clefos/kubernetes"
        // sh "mv lighttpd/Dockerfile ."
        // sh "cp -r lighttpd/cfg_files ."
        app33 = docker.image("clefos/lighttpd")
        // sh "rm -R cfg_files"
        // sh "mv Dockerfile lighttpd/"
        // sh "docker rmi clefos/lighttpd"
        // sh "mv mariadb/Dockerfile ."
        // sh "mv mariadb/allow-skip-name.cnf ."
        // sh "mv mariadb/docker-entrypoint.sh ."
        // sh "mv mariadb/fix-permissions.sh ."
        app34 = docker.image("clefos/mariadb")
        // sh "mv Dockerfile mariadb/"
        // sh "mv allow-skip-name.cnf mariadb/"
        // sh "mv docker-entrypoint.sh mariadb/"
        // sh "mv fix-permissions.sh mariadb/"
        // sh "docker rmi clefos/mariadb"
        // sh "mv MEAN/Dockerfile ."
        // sh "mv MEAN/mongo.repo ."
        app35 = docker.image("clefos/mean")
        // sh "mv Dockerfile MEAN/"
        // sh "mv mongo.repo MEAN/"
        // sh "docker rmi clefos/mean"
        // sh "cd meanjs ; make all"
        app36 = docker.image("clefos/meanjs") 
        // sh "docker rmi clefos/meanjs"
        // sh "mv mediawiki/Dockerfile ."
        // sh "mv mediawiki/fpm-pool-www.conf ."
        // sh "mv mediawiki/fpm.conf ."
        // sh "mv mediawiki/mediawiki-start ."
        // sh "mv mediawiki/nginx.conf ."
        // sh "mv mediawiki/supervisord.conf ."
        app37 = docker.image("clefos/mediawiki")
        // sh "mv Dockerfile mediawiki/"
        // sh "mv fpm-pool-www.conf mediawiki/"
        // sh "mv fpm.conf mediawiki/"
        // sh "mv mediawiki-start mediawiki/"
        // sh "mv nginx.conf mediawiki/"
        // sh "mv supervisord.conf mediawiki/"
        // sh "docker rmi clefos/mediawiki"
        // sh "mv memcached/Dockerfile ."
        app38 = docker.image("clefos/memcached")
        // sh "mv Dockerfile memcached/"
        // sh "docker rmi clefos/memcached"
        // // sh "cd microclimate ; make all"
        // app39 = docker.image("clefos/bats")
        // app40 = docker.image("clefos/curl")
        // app41 = docker.image("clefos/helm")
        // app42 = docker.image("clefos/jenkins")
        // app43 = docker.image("clefos/jnlp-slave")
        // app44 = docker.image("clefos/kubectl")
        // app45 = docker.image("clefos/minikube")
        // sh "cd mongodb ; make all"
        app46 = docker.image("clefos/mongodb")
        // sh "cd mono ; make all"
        app47 = docker.image("clefos/mono")
        // sh "docker rmi clefos/mongodb"
        // sh "docker rmi clefos/mono"
        // sh "cd nginx ; make all"
        app48 = docker.image("clefos/nginx")
        // sh "docker rmi clefos/nginx"
        // sh "cd nodejs ; make all"
        app49 = docker.image("clefos/node:8")
        app50 = docker.image("clefos/node:10")
        app51 = docker.image("clefos/node:12")
        // sh "docker rmi clefos/node:8"
        // sh "docker rmi clefos/node:10"
        // sh "docker rmi clefos/node:12"
        // sh "cd openJDK ; make all"
        app52 = docker.image("clefos/openjdk:8")
        app53 = docker.image("clefos/openjdk:11")
        app54 = docker.image("clefos/openjdk:12")
        // sh "docker rmi clefos/openjdk:8"
        // sh "docker rmi clefos/openjdk:11"
        // sh "docker rmi clefos/openjdk:12"
        // sh "cd hadoop-openshift ; wget https://archive.apache.org/dist/hadoop/core/hadoop-3.1.0/hadoop-3.1.0.tar.gz"
        // sh "cd openshift-spark/spark/zeppelin ; wget https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/5.3.2/lucene-core-5.3.2.jar"
        // sh "cd openshift-spark ; make all"
        app55 = docker.image("docker.io/clefos/spark")
        app56 = docker.image("docker.io/clefos/zeppelin")
        // sh "docker rmi docker.io/clefos/spark"
        // sh "docker rmi docker.io/clefos/zeppelin"
        // sh "cd owncloud ; make all"
        app57 = docker.image("clefos/owncloud")
        // sh "docker rmi clefos/owncloud"
        // sh "cd postgresql ; make all"
        app58 = docker.image("clefos/postgresql")
        // sh "docker rmi clefos/postgresql"
        // sh "cd puppet ; make all"
        app59 = docker.image("clefos/puppet")
        // sh "docker rmi clefos/puppet"
        // sh "cd qpid ; make clefos/qpid"
        app60 = docker.image("clefos/qpid")
        // sh "docker rmi clefos/qpid"
        // sh "cd R-base ; make all"
        app61 = docker.image("clefos/r-base")
        // sh "docker rmi clefos/r-base"
        // sh "cd rabbitmq ; make all"
        app62 = docker.image("clefos/rabbitmq")
        // sh "docker rmi clefos/rabbitmq"
        // sh "cd react ; make all"
        app63 = docker.image("react-api")
        app64 = docker.image("react-client")
        // sh "docker rmi react-client"
        // sh "docker rmi react-api"
        // sh "cd redis ; make all"
        app65 = docker.image("clefos/redis")
        // sh "docker rmi clefos/redis"
        // sh "cd registry ; make all"
        app66 = docker.image("clefos/registry")
        // sh "docker rmi clefos/registry"
        // sh "cd saltmaster ; make all"
        app67 = docker.image("clefos/saltmaster")
        // sh "docker rmi clefos/saltmaster"
        // sh "cd solr ; make all"
        app68 = docker.image("clefos/solr")
        // sh "docker rmi clefos/solr"
        // sh "cd spark ; make all"
        app69 = docker.image("clefos/spark-sa")
        // sh "docker rmi clefos/spark-sa"
        // sh "cd spark-ui-proxy ; make all"
        app70 = docker.image("clefos/spark-ui-proxy")
        // sh "docker rmi clefos/spark-ui-proxy"
        // sh "cd ssh ; make all"
        app71 = docker.image("clefos/ssh")
        // sh "docker rmi clefos/ssh"
        // sh "cd swarm ; make all"
        app72 = docker.image("clefos/swarm")
        // sh "docker rmi clefos/swarm"
        // sh "cd systemd ; make all"
        app73 = docker.image("clefos/systemd")
        // sh "docker rmi clefos/systemd"
        // sh "cd tomcat ; make all"
        app74 = docker.image("clefos/tomcat")
        // sh "docker rmi clefos/tomcat"
        // sh "cd tools ; make all"
        app75 = docker.image("clefos/tools")
        // sh "docker rmi clefos/tools"
        // sh "cd ulboracms ; make all"
        app76 = docker.image("clefos/ulboracms")
        // sh "docker rmi clefos/ulboracms"
        // sh "cd watchtower ; make all"
        app77 = docker.image("clefos/watchtower")
        // sh "docker rmi clefos/watchtower"
        // sh "cd websphere ; make all"
        // sh "cd wordpress ; make all"
        app79 = docker.image("clefos/wordpress")
        // sh "docker rmi clefos/wordpress"
        // sh "cd wordpress-sa ; make all"
        app80 = docker.image("clefos/wordpress-sa")
        // sh "docker rmi clefos/wordpress-sa"
    }

    stage('Cleanup') {
        sh "./removeall.sh"
        sh "docker system prune -f"
    }
    // stage('Push'){
    //     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
    //         app36.push("meanjs")
    //     }
        
    // }
    
}