#!/bin/bash

# Script to download Jetpack using Nvidia SDK manager for further
# offline installation

# Provide Nvidia account credentials in $NV_USER and $NV_PWD

set -eou pipefail

download_path=$(pwd)/download
mkdir -p $download_path

# Jetson Xavier AGX with 16GB RAM
jetson_model=${JETSON_MODEL:-"P2888-0001"}
jetpack_version=${JETPACK_VERSION:-4.3}

sdkmanager \
    --exitonfinish \
    --user $NV_USER \
    --password $NV_PWD \
    --license accept \
    --downloadfolder $download_path \
    --cli downloadonly \
    --product Jetson \
    --version $jetpack_version \
    --targetos Linux \
    --target $jetson_model \
    --flash skip
