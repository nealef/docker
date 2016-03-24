FROM 		brunswickheads/clefos71-java-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

ENV 		JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin JAVA_CLASSPATH=$JAVA_CLASSPATH:$JAVA_HOME:lib

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum install --setopt=tsflags=nodocs ade mariadb mariadb-java-client supervisor openssh-server rsyslog -y && \
		yum clean all && \ 
		mkdir -p /var/local/ade && \
		groupadd ade && \
		useradd -m -c "ADE Administrator" -g ade ade && \
		sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config && \
		sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
		echo "AllowUsers ade" >> /etc/ssh/sshd_config && \
		sed -ri 's/session(\s+)required(\s+)pam_loginuid\.so/#/' /etc/pam.d/sshd && \
		ssh-keygen -A && \
		mkdir -p /home/ade/.ssh && \
		ssh-keygen -q -t dsa -N "" -f /home/ade/.ssh/id_dsa && \
		ssh-keygen -q -t rsa -N "" -f /home/ade/.ssh/id_rsa && \
		mv /home/ade/.ssh/id_rsa.pub /home/ade/.ssh/authorized_keys && \
		echo "******** RSA PrivateKey to use to connect to container ********" && \
		cat /home/ade/.ssh/id_rsa && \
		echo 'export JAVA_HOME=/opt/ibm/java' >>/home/ade/.bashrc && \
		echo 'export JAVA_CLASSPATH=$JAVA_HOME/lib' >>/home/ade/.bashrc && \
		echo 'export PATH=$PATH:/opt/ade/bin:$JAVA_HOME/bin' >>/home/ade/.bashrc && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log /etc/yum.repos.d/epel.repo

# copy cfg files:
ADD		./cfg_files/ade.tar /

# set up env:
RUN 		chmod +x /etc/init.d/sshd && \
		mkdir -p /var/log/supervisor /var/local/ade && \
		chown -R ade:ade /home/ade/.ssh /opt/ade/conf /var/local/ade

EXPOSE		22

VOLUME 		/var/local/ade

ENTRYPOINT	["/docker-entrypoint.sh"]

# start services:
CMD 		["supervisord"]
