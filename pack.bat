@echo off
setlocal

@REM Set codepage to UTF-8(65001)
@for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
@if /I %codepage% NEQ 65001 ( 
    echo [INFO]: Active code page is not 65001^(UTF-8^). [%codepage%]
    chcp 65001
)

echo This is an onward packing script and not for decrements or clean builds.

set project_root=%~dp0
set project_name=WinShareAsSym
set build_dir=%project_root%build\
set build_config_dir=%build_dir%config\
set build_cache_dir=%build_dir%build\
set build_dest_dir=%build_dir%dist\
set product_build_cache_dir=%build_cache_dir%%project_name%\

if not exist "%project_root%src\product_version.txt" (
    set product_version=v0.0.0
    echo [WARN]: product_version.txt not found, using default version: %product_version%
) else (
    for /f "usebackq delims=" %%i in ("%project_root%src\product_version.txt") do set product_version=%%i
)

echo [INFO]: Project root directory: %project_root%
echo [INFO]: Project name: %project_name%
echo [INFO]: Product version: %product_version%

echo ------

where 7z >nul 2>&1
if ERRORLEVEL 1 (
    echo [ERROR]: 7z is not found in PATH.
    exit /b 1
) else (
    echo [INFO]: 7z is found, ready.
)

@REM Check if directory exists
call :ensure_dir_exist "%build_dir%" && if ERRORLEVEL 1 exit /b 1
call :ensure_dir_exist "%build_config_dir%" && if ERRORLEVEL 1 exit /b 1
call :ensure_dir_exist "%build_cache_dir%" && if ERRORLEVEL 1 exit /b 1
call :ensure_dir_exist "%build_dest_dir%" && if ERRORLEVEL 1 exit /b 1
call :ensure_dir_exist "%product_build_cache_dir%" && if ERRORLEVEL 1 exit /b 1

echo [INFO]: All directories exist, ready.

choice /M "Want to rectify product version?"

if ERRORLEVEL 2 (
    echo [INFO]: Skipping product version rectification.
) else (
    set /p product_version="Please input product version: "
)

choice /M "Confirm?"

if ERRORLEVEL 2 (
    echo [INFO]: Abort.
    exit /b 0
)

@REM Prepare directory exclude list
if not exist "%build_config_dir%src_exclude_dir_list.txt" (
    @REM use default list
    set src_exclude_dir_list_content=^
temp
    echo %src_exclude_dir_list_content%>"%build_config_dir%src_exclude_dir_list.txt"
) else (
    for /f "usebackq delims=" %%i in ("%build_config_dir%src_exclude_dir_list.txt") do set src_exclude_dir_list_content=%src_exclude_dir_list_content% "%%i"
)

@REM Prepare file exclude list
if not exist "%build_config_dir%src_exclude_file_list.txt" (
    @REM use default list
    set src_exclude_file_list_content=^
temp
    echo %src_exclude_file_list_content%>"%build_config_dir%src_exclude_file_list.txt"
) else (
    for /f "usebackq delims=" %%i in ("%build_config_dir%src_exclude_file_list.txt") do set src_exclude_file_list_content=%src_exclude_file_list_content% "%%i"
)

robocopy /S "%project_root%src" "%product_build_cache_dir:~0,-1%" * /XD %src_exclude_file_list_content% /XF %src_exclude_dir_list_content% 

xcopy /Y "%project_root%LICENSE" "%product_build_cache_dir%"
xcopy /Y "%project_root%README.md" "%product_build_cache_dir%"

if exist "%build_dest_dir%%project_name%-%product_version%.zip" (
    echo [WARN]: %build_dest_dir%%project_name%-%product_version%.zip already exists, removing it.
    del "%build_dest_dir%%project_name%-%product_version%.zip"
)

7z a -tzip "%build_dest_dir%%project_name%-%product_version%.zip" "%product_build_cache_dir%"

endlocal
goto :eof


:ensure_dir_exist
    if not exist "%~1" mkdir "%~1"
    if not exist "%~1" (
        echo [ERROR]: Failed to create directory "%~1"
        exit /b 1
    )
goto :eof
