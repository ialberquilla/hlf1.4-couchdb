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

5. Go to the template
`cd hlf1.4-couchdb`

# Start the network
1. Generate the crypto material
`./scripts/generate.sh`

2. Start peers
`./scripts/start.sh`

# Stop the network
`./scripts/stop.sh`
