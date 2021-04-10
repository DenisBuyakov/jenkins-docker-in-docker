FROM jenkinsci/blueocean

USER root
RUN apk upgrade -U \
    && apk --no-cache add \
     unzip \
     curl \
     nano \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -R aws
