FROM jenkins/jenkins:alpine

USER root
RUN apk upgrade -U \
    && apk --no-cache add \
     unzip \
     curl \
     nano \
     docker-cli \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -R aws

USER jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /etc/casc.yaml
COPY plugins.yml /usr/share/jenkins/ref/plugins.txt
RUN sed -i 's/ //g' /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /etc/casc.yaml

