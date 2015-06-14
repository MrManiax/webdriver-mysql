FROM aerofs/webdriver-python
RUN apt-get update && apt-get install -y apt-utils debconf-utils openssh-server

RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

RUN apt-get install -y openjdk-7-jdk

RUN adduser --quiet jenkins

RUN echo "jenkins:jenkins" | chpasswd

EXPOSE 22

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN  apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" mysql-server

EXPOSE 3306

RUN pip install pip --upgrade
RUN pip install MySQL-python

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python -u /skripte/main.py"]
