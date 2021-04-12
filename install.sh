install.sh
#!/bin/bash
sudo apt-get update -y
sudo apt-get install docker.io -y
sudo apt-get install python3-pip -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker ubuntu
exit
