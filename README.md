# hlf1.4-couchdb
A example of a Hyperledger Fabric network with two organizations and couchdb database

# Installation instructions

1. Install Hyperledger fabric dependencies:
https://hyperledger-fabric.readthedocs.io/en/release-1.4/prereqs.html

2. Donwload fabric binaries and samples:
`curl -sSL http://bit.ly/2ysbOFE | bash -s 1.4.3`

3. Go to fabric samples:
`cd fabric-samples`

4. Download the template:
`git clone https://github.com/ialberquilla/hlf1.4-couchdb`

6. Install chaincode nodejs dependencies
`cd hlf1.4-couchdb/chaincode`
`npm install`

5. Go to the template
`cd ..`



# Start the network
1. Generate the crypto material
`./scripts/generate.sh`

2. Start the network and install the fabcar chaincode example on it
`./scripts/start.sh`

# Couchdb admin
Couch db will be available at
http://127.0.0.1:5984/_utils/ & http://127.0.0.1:5984/_utils/

When chaincode is instanciated, it creates ten examples car in chaincode, then in start.sh there is a invoke call to change CAR0 owner to Iván, looking into http://192.168.1.128:5984/_utils/#/database/mychannel_fabcc/_all_docs CAR0 will be at revision two, due to this change. 

# Stop the network
`./scripts/stop.sh`

