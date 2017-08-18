Docker Cloud9 v3
================
Github: https://github.com/gai00/docker-cloud9v3  
Docker hub: https://registry.hub.docker.com/u/gai00/cloud9v3/  
Reference: https://hub.docker.com/r/sapk/cloud9/

## About
This Docker Container version is Cloud9 Core SDK v3 on Ubuntu 16.04,  
with ubuntu user permission. (yes, not root.)  
  
PS: ubuntu didn't setup development environment, only node v4 to run cloud9 server.

## -- bash file can be found on github --

## init: (init.sh)  
This step is for keep user settings.  
(not include linux environment state)  

    mkdir workspace
    mkdir workspace/.c9
    touch user.settings
    touch state.settings
    touch project.settings
    sudo chown 999:docker -R ./workspace *.settings
    
chown 999 uid is my docker-cloud9 gave when I sudo chown ubuntu:ubuntu on my workspace in docker.

## usage: (start.sh)
Fully settings and port features version.

    docker run -d \
        -v $(pwd)/workspace:/home/ubuntu/workspace \
        -v $(pwd)/user.settings:/home/ubuntu/.c9/user.settings \
        -v $(pwd)/state.settings:/home/ubuntu/workspace/.c9/state.settings \
        -v $(pwd)/project.settings:/home/ubuntu/workspace/.c9/project.settings \
        --expose 8181 \
        --expose 8080-8082 \
        -p 8181:8181 \
        -p 8080:8080 \
        -p 8081:8081 \
        -p 8082:8082 \
        gai00/cloud9v3 \
        --collab \
        --auth cloud9:cloud9v3

## Connect
1. open browser
2. go to http://[your ip or localhost]:8181
3. input username and password.
4. enjoy, or sudo chown ubuntu: -R ~/workspace before using.

## Custom
if you want to change login username:password, modify --auth parameters you want.  
  
<b>--expose 8181</b> cloud9 ide container listening  
<b>--expose 8080-8082</b> for service you write.  
<b>-p 8181:8181</b> mapping port to outside, if you want to connect with other port, change this.  
ex: <b>-p 9000:8181</b> change port to http://localhost:9000/  
<b>--collab</b> as name, useful for multi-user, sad on auth.  
<b>--auth username:password</b> change auth username/password.
