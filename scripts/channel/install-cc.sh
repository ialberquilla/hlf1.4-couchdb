#!/bin/bash
installChaincode(){
    ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
    PEER=$1
    ORG=$2
    CORE_PEER_LOCALMSPID=$3
    PORT=$4
    CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/$ORG.example.com/peers/$PEER.$ORG.example.com/tls/ca.crt
    CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/$ORG.example.com/users/Admin@$ORG.example.com/msp
    CORE_PEER_ADDRESS=$PEER.$ORG.example.com:$PORT
    CHANNEL_NAME=mychannel
    CORE_PEER_TLS_ENABLED=true
    DELAY=3
    MAX_RETRY=10
    COUNTER=0

    peer chaincode install -l node -n fabcc -v $5 -p /opt/gopath/src/github.com/chaincode >&log.txt
    cat log.txt
}

echo "Installing chaincode for org1..."
installChaincode peer0 org1 Org1MSP 7051 1.0
echo "Chaincode installed for org1..."

echo "Installing chaincode for org2..."
installChaincode peer0 org2 Org2MSP 8051 1.0
echo "Chaincode installed for org2..."


echo "Instanciating the contract..."
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile $ORDERER_CA -C mychannel -l node -n fabcc -v 1.0 -c '{"Args":["initLedger"]}' >&log.txt
cat log.txt

echo "Invoking changeCarOwner to change Owner to CAR0"
sleep 10
peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile $ORDERER_CA -C mychannel -n fabcc -c '{"Args":["changeCarOwner","CAR0","Iván"]}' >&log.txt
cat log.txt