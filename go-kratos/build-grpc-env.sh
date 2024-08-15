#!/bin/bash

set -e
set -u

FOLDER=`cd $(dirname $0);pwd`
INSTALL_BIN_FOLDER=/usr/local/bin
INSTALL_INCLUDE_FOLDER=/usr/local/include  

TEMP_FOLDER=$(mktemp -d)
PROTOC_DOWNLOAD_URL=$( curl -s https://api.github.com/repos/protocolbuffers/protobuf/releases/latest  | jq -r ".assets[].browser_download_url" | grep linux-x86_64 )
PROTOC_FILE_NAME=${PROTOC_DOWNLOAD_URL##*/}
DOWNLOAD_OUTPUT_FILE=${TEMP_FOLDER}/${PROTOC_FILE_NAME}

function install_protoc(){
    curl -L -o ${TEMP_FOLDER}/${PROTOC_FILE_NAME} ${PROTOC_DOWNLOAD_URL} 
    unzip ${TEMP_FOLDER}/${PROTOC_FILE_NAME} -d ${TEMP_FOLDER}
    sudo cp -r ${TEMP_FOLDER}/bin/protoc ${INSTALL_BIN_FOLDER}
    sudo cp -r ${TEMP_FOLDER}/include/* ${INSTALL_INCLUDE_FOLDER}
    rm -rf ${TEMP_FOLDER}
}

install_protoc
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest