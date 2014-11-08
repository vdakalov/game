#!/bin/bash

WORKING_DIR=/home/raccoon/Workspace/projects/game
SOURCE_DIR=${WORKING_DIR}/scripts
TARGET_DIR=${WORKING_DIR}/src
TARGET_FILE=game

BUFFER=${WORKING_DIR}/buffer.js
DEPENDENCIES_INJECTION=${SOURCE_DIR}/etc/di.coffee

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

function loadDir {
    for file in $1/*; do
        if [ -d "$file" ]; then
            loadDir ${file}
        elif [ -f "$file" ] && [ "${file##*.}" == "coffee" ] && [ ${file} != ${DEPENDENCIES_INJECTION} ]; then
            compile ${file}
        fi
    done
}


compile ${DEPENDENCIES_INJECTION}
loadDir ${SOURCE_DIR}

if [ "$1" == "compress" ]; then
    compress
else
    cp ${BUFFER} ${TARGET_DIR}/${TARGET_FILE}.min.js
fi