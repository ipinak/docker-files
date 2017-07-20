######################################################################
### Description: Dockerfile to setup jenkins, but with ssh
###              capabilities so you can configure it somehow.
### 
### Build: docker build -t ipinak/jenkins-ssh .
### Usage: docker run -d -p 49001:8080 -p 22 -v \
###               $PWD/jenkins:/var/lib/jenkins -t ipinak/jenkins-ssh
### 
######################################################################
FROM ubuntu:13.10
MAINTAINER Ioannis Pinakoulakis "giannis.pin@gmail.com"

### Install all the dependencies
RUN apt-get update
RUN apt-get -y install wget git openssh-server openssl
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean

### Creata a user: jenkins
RUN useradd -m -d /home/jenkins -p $(openssl passwd -1 'temp') \
            -G sudo -s /bin/bash jenkins

### Download jenkins and set it up.
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins
RUN sed -i -e "s/PermitRootLogin\syes/PermitRootLogin no/g" /etc/ssh/sshd_config

### Export the directory you want to share from the host, not from
### the container.
VOLUME /var/lib/jenkins
ENV JENKINS_HOME /var/lib/jenkins

### Expose 2 ports, 8080 for a web service for jenkins and 22 for ssh
EXPOSE 8080
EXPOSE 22

### Copy required files and set execution permissions
#ADD ./start.sh /start.sh
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
#RUN chmod +x /start.sh

CMD ["/usr/local/bin/run", "/start.sh"]
