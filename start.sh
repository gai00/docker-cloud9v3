#!/bin/bash
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