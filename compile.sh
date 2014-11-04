#!/bin/bash

WORKING_DIR=/home/raccoon/Workspace/projects/game
SOURCE_DIR=${WORKING_DIR}/scripts
TARGET_DIR=${WORKING_DIR}/src
TARGET_FILE=game

BUFFER=${WORKING_DIR}/buffer.js

echo "Compilation start!"

if [ -f ${BUFFER} ]; then
    echo "Clean buffer..."
    rm ${BUFFER}
fi

function compile {
    echo "compile ${1}"
    /usr/local/bin/coffee --print $1 >> ${BUFFER}
}

function compress {
    echo "Compress start!"
    java -jar /home/raccoon/opt/gcc/compiler.jar --create_source_map=${TARGET_DIR}/${TARGET_FILE}.map.js --charset=UTF-8 --js=${BUFFER} --js_output_file=${TARGET_DIR}/${TARGET_FILE}.min.js
    echo -e "\033[00;32mFile ${TARGET_DIR}/${TARGET_FILE}.min.js created!\033[0m"
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

if [ "$1" == "compress" ]; then
    compress
else
    cp ${BUFFER} ${TARGET_DIR}/${TARGET_FILE}.min.js
fi