#!bin/bash

docker compose down
rm -rf Volume

mkdir Volume/ERPNext/Site -p
mkdir Volume/ERPNext/Log -p

bash Start.sh
