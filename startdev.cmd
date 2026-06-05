@echo off

rem Default parameter values
set vs_ver=2026
set host_arch=x64
set arch=x64

rem Parsing the arguments
:parse_args
if "%~1" == "" goto done_args

if /I "%~1" == "-vs_ver" (
    set "vs_ver=%~2"
    shift
    shift
    goto parse_args
)
if /I "%~1" == "-host_arch" (
    set "host_arch=%~2"
    shift
    shift
    goto parse_args
)
if /I "%~1" == "-arch" (
    set "arch=%~2"
    shift
    shift
    goto parse_args
)

echo Unknown argument: %~1
exit /b 1

:done_args

rem Choosing the version
if "%vs_ver%"=="2026" (
    set "vs_dev_cmd=%ProgramFiles%\Microsoft Visual Studio\18\Community\Common7\Tools\VsDevCmd.bat"
) else if "%vs_ver%"=="2022" (
    set "vs_dev_cmd=%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
) else (
    echo Unknown VS version: %vs_ver%
    exit /b 1
)

echo Calling: "%vs_dev_cmd%" -arch=%arch% -host_arch=%host_arch%
call "%vs_dev_cmd%" -arch=%arch% -host_arch=%host_arch%

set "vs_ver="
set "host_arch="
set "arch="
