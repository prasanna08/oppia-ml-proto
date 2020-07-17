#!/usr/bin/env bash

# Copyright 2020 The Oppia Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS-IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

##########################################################################

# This file should be invoked only when oppia-ml proto specs are being used as
# dependency in other project.

EXPECTED_PWD='oppia-ml-proto'
DIR_STRUCTURE=(${PWD//// })
if [ ${DIR_STRUCTURE[-1]} != $EXPECTED_PWD ]; then
  echo ""
  echo "  WARNING   This script should be run from the oppia-ml-proto/ root folder."
  echo ""
  return 1
fi

export OPPIA_ML_PROTO_DIR=$(pwd)
export THIRD_PARTY_DIR=$OPPIA_ML_PROTO_DIR/third_party

mkdir -p $THIRD_PARTY_DIR

# Set prototool path.
export PROTOTOOL_PATH=$THIRD_PARTY_DIR/prototool-1.10.0
export PROTOTOOL=$PROTOTOOL_PATH/prototool

echo Checking if prototool is installed in $PROTOTOOL_PATH

if [ ! -d "$PROTOTOOL_PATH" ]; then
  echo Installing prototool
  mkdir "$PROTOTOOL_PATH"
  curl -sSL "https://github.com/uber/prototool/releases/download/v1.10.0/prototool-$(uname -s)-$(uname -m)" \
    -o "$PROTOTOOL_PATH/prototool"
  chmod +x "$PROTOTOOL_PATH/prototool"
fi
