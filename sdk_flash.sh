#!/bin/bash

# Script to flash Jetson Xavier AGX using Nvidia SDK manager from
# files downloaded using sdk_dl.sh, in offline mode

# The installation is not automatic, one needs to interact with
# the UI and put the target device into the reset mode.
# Also, before the installation proceeds to SDK you will need to log onto the target device and set up ssh connection.

set -eou pipefail

download_path=$(pwd)/download
mkdir -p $download_path

# Jetson Xavier AGX with 16GB RAM
jetson_model=${JETSON_MODEL:-"P2888-0001"}
jetpack_version=${JETPACK_VERSION:-4.3}

sdkmanager \
    --offline \
    --exitonfinish \
    --license accept \
    --downloadfolder $download_path \
    --cli install \
    --product Jetson \
    --version $jetpack_version \
    --targetos Linux \
    --target $jetson_model \
    --flash all
