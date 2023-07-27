#!/bin/sh

VERSION="v1.3.1"
URL="https://github.com/xssnick/Tonutils-Proxy/releases/download/${VERSION}/ios-lib.zip"

ORIGINAL_NAME="tonutils-proxy"
XCFRAMEWORK_NAME="TonutilsProxy"

DOWNLOAD_PATH="./download"
XCFRAMEWORK_PATH="./Artifacts/${XCFRAMEWORK_NAME}.xcframework"

rm -rf $DOWNLOAD_PATH
rm -rf $XCFRAMEWORK_PATH

mkdir -p "${DOWNLOAD_PATH}/include/lib${XCFRAMEWORK_NAME}"

curl --show-error --location $URL | tar -xf - -C $DOWNLOAD_PATH

mv "${DOWNLOAD_PATH}/${ORIGINAL_NAME}.a" "${DOWNLOAD_PATH}/lib${XCFRAMEWORK_NAME}.a"
mv "${DOWNLOAD_PATH}/${ORIGINAL_NAME}.h" "${DOWNLOAD_PATH}/include/lib${XCFRAMEWORK_NAME}/${XCFRAMEWORK_NAME}.h"

xcodebuild \
    -create-xcframework \
    -library "${DOWNLOAD_PATH}/lib${XCFRAMEWORK_NAME}.a" \
    -headers "${DOWNLOAD_PATH}/include" \
    -output $XCFRAMEWORK_PATH

rm -rf $DOWNLOAD_PATH
