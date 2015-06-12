FROM aerofs/webdriver-python
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y debconf-utils
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

RUN apt-get install -y openjdk-7-jdk

RUN adduser --quiet jenkins

RUN echo "jenkins:jenkins" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN echo "mysql-server mysql-server/root-pass password ''" | debconf-set-selections
RUN echo "mysql-server mysql-server/re-root-pass password ''" | debconf-set-selections
RUN echo "mysql-server mysql-server/remove-test-db select false" | debconf-set-selections
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql

RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe && sleep 10s && python -u /tmp/main.py"] 
