#!/bin/bash

set -e
WORK_DIR=$@
all_files+=( $(ls  -d $WORK_DIR/*) )

if [ -z $@ ] ; then 
    echo "please pass your working directory as an argument..."
    exit 1
fi

echo "switching to $WORK_DIR"
cd $WORK_DIR

for file in "${all_files[@]}"
    do
        echo "changing directory to $file"
        cd $file
        echo "checking out develop branch"
        git checkout develop
        echo "pulling latest changes from develop"
        git pull
    done
exit 0

