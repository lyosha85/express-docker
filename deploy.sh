#!/bin/bash
# remember to chmod +x me

docker build -t lyosha85/sample-node .
docker push lyosha85/sample-node
echo enter vps ip:
read REMOTE_IP
ssh deployer@$REMOTE_IP << EOF
docker pull lyosha85/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi lyosha85/sample-node:current || true
docker tag lyosha85/sample-node:latest lyosha85/sample-node:current
docker run -d --restart always --name web -p 3000:3000 lyosha85/sample-node:current
EOF
