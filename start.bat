@echo off
setlocal EnableDelayedExpansion

REM Build the Docker image
docker build -t devenv .

REM Start building the docker run command with the current directory mount
set "cmd=docker run --rm -it -v "%~dp0:/devenv""

REM Process all parameters as additional mounts
:param_loop
if "%1" neq "" (
    REM Get the full path and remove trailing backslash if present
    set "fullpath=%~f1"
    if "!fullpath:~-1!"=="\" set "fullpath=!fullpath:~0,-1!"
    
    REM Get just the folder name without trailing backslash
    for %%I in ("!fullpath!") do set "foldername=%%~nxI"
    
    set "cmd=!cmd! -v "!fullpath!:/home/user/work/!foldername!""
    shift
    goto param_loop
)

REM Add the image name and execute
set "cmd=!cmd! devenv"
%cmd%