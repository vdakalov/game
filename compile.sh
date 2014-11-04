#!/bin/bash

WORKING_DIR=/home/raccoon/Workspace/projects/game
SOURCE_DIR=${WORKING_DIR}/scripts
TARGET_DIR=${WORKING_DIR}
TARGET_FILE=game

DEBUG=$1

# source buffer (for js)
BUFFER=""

function compile {
    echo "compile ${1}"
    SOURCE_JS=$(/usr/local/bin/coffee --no-header --print --compile $1)
    BUFFER=${BUFFER}${SOURCE_JS}
}

function compress {
    echo "compress..."
    if [ ${DEBUG} == "debug" ]; then
        echo "-output-buffer-------------------------------"
        echo ${BUFFER};
        echo "---------------------------------------------"
    fi
    echo ${BUFFER} | /usr/local/bin/uglifyjs --compress --output ${TARGET_DIR}/${TARGET_FILE}.min.js
}

for line in $(cat ${SOURCE_DIR}/dependencies); do
    compile ${SOURCE_DIR}/${line}
done

for file in ${SOURCE_DIR}/*.coffee; do
    filename=${file#${SOURCE_DIR}/}
    if [ -f ${file} ] && [ "$(grep ${filename} ${SOURCE_DIR}/dependencies)" == "" ]; then
        compile ${file}
    fi
done

compress