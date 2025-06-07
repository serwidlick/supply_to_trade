#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./create_feature.sh feature_name"
  exit 1
fi

FEATURE_NAME=$1
BASE_PATH="lib/features/$FEATURE_NAME"

mkdir -p "$BASE_PATH/cubit"
mkdir -p "$BASE_PATH/data"
mkdir -p "$BASE_PATH/presentation"

echo "Feature structure created at $BASE_PATH"
