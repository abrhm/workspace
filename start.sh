#!/bin/bash

# TODO: Refactor start.sh file

# Initialize rebuild flag
rebuild=false

# Check for -r flag
while [[ $1 == "-r" ]]; do
    rebuild=true
    shift
done

# Build docker image with --no-cache only if -r flag is present
if [ "$rebuild" = true ]; then
    docker buildx build --no-cache -t workspace .
else
    docker buildx build -t workspace .
fi

# Start building the docker run command with the current directory mount
cmd="docker run --rm -it -v $(pwd):/workspace"

# Process remaining parameters as additional mounts
while [ $# -gt 0 ]; do
    if [ "$1" != "-r" ]; then
        # Get the full path and folder name
        fullpath=$(realpath "$1")
        foldername=$(basename "$fullpath")
        
        # Add the mount to the command
        cmd="$cmd -v $fullpath:/home/user/work/$foldername"
    fi
    shift
done

# Add the image name and execute
cmd="$cmd workspace"
eval "$cmd"