Installation 
------------
1. Install [Git](https://git-scm.com/downloads)
2. copy use git
   ```bash
   git clone https://github.com/DenisBuyakov/jenkins-docker-in-docker.git
   cd jenkins-docker-in-docker/
    ```
1. Install [Docker](https://docker.com)  
   (ubuntu option)[Install for ubuntu](https://docs.docker.com/engine/install/ubuntu/)
   ```bash
   sudo ./install-docker
   sudo systemctl status docker
   ```
3. install jenkins
   (optional local) use docker env
    ```bash
   cd docker
   cp .env.template .env
   sudo docker-compose up -d
    ```
   Usual Access URL: http://{host-address-here}:8082
   root password for jenkins in file docker/jenkins-data/secrets/initialAdminPassword  
   you can use command
   ```bash
   sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
   ```
4. install "docker" plugin and "Docker Pipeline"
5. (aws ubuntu option)swap enable
   ```bash
   sudo dd if=/dev/zero of=/swapfile bs=128M count=16
   sudo chmod 600 /swapfile
   sudo mkswap /swapfile
   sudo swapon /swapfile
   sudo swapon -s
   sudo nano /etc/fstab
   sudo awk ... /etc/fstab > /tmp/$$
   sudo cat /tmp/$$ > /etc/fstab
   sudo rm /tmp/$$
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

