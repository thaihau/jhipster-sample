# DOCKER-VERSION 0.7.1
FROM      jdubois/jhipster-docker
MAINTAINER Thai Hau <thaihau.y@gmail.com>


# install gradle
RUN apt-get -y install gradle

# install the sample app
RUN cd /home/jhipster && \
    wget https://github.com/jhipster/jhipster-sample-app-gradle/archive/v2.19.0.zip && \
    unzip v2.19.0.zip && \
    rm v2.19.0.zip
RUN cd /home/jhipster/jhipster-sample-app-gradle-2.19.0 && npm install
RUN cd /home && chown -R jhipster:jhipster /home/jhipster
RUN cd /home/jhipster/jhipster-sample-app-gradle-2.19.0



# expose the working directory, the Tomcat port, the BrowserSync ports, the SSHD port, and run SSHD
VOLUME ["/jhipster"]
EXPOSE 8080 3000 3001 22
CMD    /usr/sbin/sshd -D