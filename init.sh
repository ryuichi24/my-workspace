#!/bin/sh

PROJECT_NAME=$1
WORKSPACE_URL="https://github.com/ryuichi24/my-workspace.git"

git clone ${WORKSPACE_URL} ${PROJECT_NAME} \
    && cd ${PROJECT_NAME} \
    && rm -rf .git \
    && ./make_env.sh \
    && rm ./init.sh
