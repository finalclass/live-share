#!/bin/bash

git clone https://github.com/finalclass/live-share-output.git
cd live-share-output

while true; do
    git pull -f
    sleep 1
done

