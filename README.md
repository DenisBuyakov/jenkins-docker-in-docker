Installation 
------------
1. Install [Docker](https://docker.com)  
   (ubuntu option)[Install for ubuntu](https://docs.docker.com/engine/install/ubuntu/)
   ```bash
   sudo apt-get update
   sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo \
   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
   sudo systemctl status docker
   ```
   (ubuntu option) install docker-compose 
    ```bash
   cd docker
   sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
   sudo chmod +x /usr/bin/docker-compose
    ```
2. Install [Git](https://git-scm.com/downloads)
3. copy use git
   ```bash
   git clone https://github.com/DenisBuyakov/jenkins-docker-in-docker.git
   cd jenkins-docker-in-docker/
    ```
4. install jenkins
   (optional local) use docker env
   Copy `docker/.env.template` file to `docker/.env`
    ```bash
   cd docker
   sudo docker network create jenkins
   sudo docker-compose up -d
    ```
   Usual Access URL: http://{host-address-here}:8082
   root password for jenkins in file docker/jenkins-data/secrets/initialAdminPassword  
   you can use command
   ```bash
   sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
   ```
5. install "docker" plugin and "Docker Pipeline"
6. (aws ubuntu option)swap enable
   ```bash
   sudo dd if=/dev/zero of=/swapfile bs=128M count=16
   sudo chmod 600 /swapfile
   sudo mkswap /swapfile
   sudo swapon /swapfile
   sudo swapon -s
   sudo nano /etc/fstab
    ```
   Add the following new line at the end of the file, save the file, and then exit:
   ```bash
   /swapfile swap swap defaults 0 0
   ```
7. go to "Manage Nodes and Clouds" and then "Configure Clouds" and then "Add a new cloud" and then select the "docker" type from the drop-down list.

   Docker Cloud details:
   docker host url -  `tcp://docker:2376`
   we need to set up the Server Credentials

   X.509 Client Certificate
   
   Client Key.
   Client Certificate.
   Server CA Certificate.
   from /certs directory
   you can use command
   ```bash
   sudo docker exec jenkins-docker cat /certs/client/key.pem
   sudo docker exec jenkins-docker cat /certs/client/cert.pem
   sudo docker exec jenkins-docker cat /certs/server/ca.pem
   
   sudo docker exec jenkins-blueocean cat /certs/client/key.pem
   sudo docker exec jenkins-blueocean cat /certs/client/cert.pem
   sudo docker exec jenkins-docker-in-docker cat /certs/server/ca.pem
   ```
   checkbox enabled

