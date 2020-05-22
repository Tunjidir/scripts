#!/bin/bash

#author: olatunji oniyide

white=$'\e[0m'
red=$'\e[1;31m'
grn=$'\e[1;32m'

WORK_DIR=$@

if [ -z $@ ] ; then 
    echo "no directory passed as argument using current working directory"
    WORK_DIR=$(pwd)
fi

echo ++++++ switching to $WORK_DIR ++++++
cd $WORK_DIR

all_files+=( $(ls  -d $WORK_DIR/*) )

for file in "${all_files[@]}"
    do
        echo ++++++ changing directory to $file ++++++
        cd $file
        echo ++++++ checking out develop branch ++++++

        git checkout develop > /dev/null 2>&1

        if [ $? -ne 0 ]; then
           echo $red cannot find branch develop +++++ $white
           continue
        fi
        echo $grn ++++++ pulling latest changes from develop ++++++ $white
        git pull
    done
exit 0

