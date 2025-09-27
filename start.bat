@echo off
if "%1"=="" (
    echo Error: Please provide a folder path to mount
    echo Usage: start.bat ./path/to/folder
    exit /b 1
)

REM Build the Docker image
docker build -t devenv .

REM Run the Docker container with the mounted volume
docker run --rm -it -v "%1:/home/user/work/%~n1" devenv