#!/bin/bash

if [ -z $1 ] ; then
    echo "please pass project name..."
fi

PROJECT_NAME=$1
GROUP_ID="com.oniyide"

mvn archetype:generate -DarchetypeGroupId=com.airhacks \
 -DarchetypeArtifactId=jakartaee-essentials-archetype \
 -Darchetype.interactive=false --batch-mode -Dversion=0.0.1 \
 -DgroupId=$GROUP_ID -DartifactId=$PROJECT_NAME