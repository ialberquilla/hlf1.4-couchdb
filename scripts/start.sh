#!/bin/bash

echo "Creating containers... "
docker-compose -f docker-compose-cli.yaml -f docker-compose-couch.yaml up -d
echo 
echo "Containers started" 
echo 
docker ps

echo
#Creating channel and join org1
docker exec -it cli ./scripts/channel/createChannel.sh
#Join peers to channel
docker exec -it cli ./scripts/channel/joinPeer.sh peer0 org1 Org1MSP 7051
docker exec -it cli ./scripts/channel/joinPeer.sh peer0 org2 Org2MSP 8051

#Install chaincode
docker exec -it cli ./scripts/channel/install-cc.sh


