@echo off
setlocal EnableDelayedExpansion

REM Build the Docker image
docker build -t devenv .

REM Start building the docker run command with the current directory mount
set "cmd=docker run --rm -it -v "%~dp0:/devenv""

REM Process all parameters as additional mounts
:param_loop
if "%1" neq "" (
    set "cmd=!cmd! -v "%1:/home/user/work/%~n1""
    shift
    goto param_loop
)

REM Add the image name and execute
set "cmd=!cmd! devenv"
%cmd%