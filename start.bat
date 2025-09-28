@echo off
setlocal EnableDelayedExpansion

REM Initialize rebuild flag
set "rebuild="

REM Check for -r flag
:check_rebuild
if "%1"=="-r" (
    set "rebuild=yes"
    shift
    goto check_rebuild
)

REM Build docker image with --no-cache only if -r flag is present
if defined rebuild (
    docker build --no-cache -t workspace .
) else (
    docker build -t workspace .
)

REM Start building the docker run command with the current directory mount
set "cmd=docker run --rm -it -v "%~dp0:/workspace""

REM Process remaining parameters as additional mounts
:param_loop
if "%1" neq "" (
    if "%1"=="-r" (
        shift
        goto param_loop
    )
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
set "cmd=!cmd! workspace"
%cmd%