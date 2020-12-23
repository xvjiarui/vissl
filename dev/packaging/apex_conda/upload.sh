#!/usr/bin/bash

set -e

TOKEN=redacted

retry () {
    # run a command, and try again if it fails
    $*  || (echo && sleep 8 && echo retrying && $*)
}

for file in inside/packaging/*.bz2
do
    echo
    echo "${file}"
    retry anaconda --verbose -t "${TOKEN}" upload -u vissl --force "${file}" --no-progress
done