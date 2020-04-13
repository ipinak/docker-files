#!/bin/bash
#
# usage: ./build.sh <docker-registry>

set -euo pipefail

# load some useful utilities
source ./logger.sh

DIRECTORIES=$(ls -d */Dockerfile)
DOCKER_REGISTRY=$1

for DIR in ${DIRECTORIES}
do
    IMAGE=${DOCKER_REGISTRY}/$(grep "container\.name" ${DIR} | sed "s/LABEL.*container\.name=//g" | sed "s/\"//g")
    IMAGE_VERSIONED=${IMAGE}:1.0.0
    IMAGE_LATEST=${IMAGE}:latest

    info ">>> Building <<<"
    info ">>> ${DIR} - ${IMAGE_VERSIONED} <<<"
    docker build -t ${IMAGE_VERSIONED} -f ${DIR} . > /dev/null || {
        error ">>> Build failed <<<"
    }

    info ">>> Tagging <<<"
    docker tag ${IMAGE_VERSIONED} ${IMAGE_LATEST} > /dev/null || {
        error ">>> Tagging failed <<<"
    }

    info ">>> Pushing image <<<"
    docker push ${IMAGE_VERSIONED} > /dev/null || {
        error ">>> Pushing failed <<<"
    }

    docker push ${IMAGE_LATEST} > /dev/null || {
        error ">>> Pushing failed <<<"
    }
done
