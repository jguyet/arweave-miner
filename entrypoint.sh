#!/bin/bash

set -e

RED='\033[0;31m'
NC='\033[0m'

print_help () {
	echo "Arweave crypto miner."
	echo
	echo "Usage: "
	echo "docker run rafaelzimmermann/arweave-miner"
	echo "options:"
	echo "-w/--wallet     Wallet address."
	echo

}

for i in "$@"
do
case $i in
    -w=*|--wallet=*)
    WALLET="${i#*=}"
    ;;
esac
done

if [ -z "$WALLET" ]
then
    print_help
    exit -1
fi

/app/bin/start debug mine mining_addr "${WALLET}" enable legacy_storage_repacking enable randomx_large_pages data_dir /data peer ams-1.eu-central-1.arweave.xyz peer fra-1.eu-central-2.arweave.xyz peer sgp-1.ap-central-2.arweave.xyz peer blr-1.ap-central-1.arweave.xyz peer sfo-1.na-west-1.arweave.xyz storage_module 0,${WALLET}
