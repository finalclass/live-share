#!/bin/bash

tmp_dir=$(mktemp -d /tmp/live-share.XXXXX)
echo "Created tmp dir: $tmp_dir"
curr_dir=$(pwd)


cd $tmp_dir
rsync -av "$curr_dir/" "$tmp_dir" --delete --delete-excluded --filter=":- .gitignore" --exclude .git
git init
git add .
git commit -m "first commit"
git branch -M master
git remote add origin git@github.com:finalclass/live-share-output.git
git push -u origin master -f

while true; do
    cd $curr_dir
    rsync -av "$curr_dir/" "$tmp_dir" --delete --filter=":- .gitignore" --exclude .git
    cd $tmp_dir
    git add .
    git commit -a -m "$(date)"
    git push -f
    sleep 1
done
