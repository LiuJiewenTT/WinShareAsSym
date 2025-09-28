@echo off
setlocal

set manual_download_url=https://github.com/LiuJiewenTT/WinShareAsSym/releases
set api_url=https://api.github.com/repos/LiuJiewenTT/WinShareAsSym/releases/latest
echo Checking for updates... ^(Release only^)

:: Check for updates
for /f "tokens=1,2 delims=:" %%a in ('curl -sL %api_url% ^| findstr /i "tag_name"') do set latest_version=%%b

:: local test version
@REM set latest_version= "v1.0-beta",

set latest_version=%latest_version: =%
set latest_version=%latest_version:"=%
set latest_version=%latest_version:,=%
for /f "tokens=1 delims=-" %%a in ('echo %latest_version%') do set latest_version=%%a

if "%latest_version%" EQU "" (
    echo Failed to check for updates.
    exit /b 1
)

echo Lastest version: %latest_version%

if "%latest_version:~0,1%" EQU "v" (
    set latest_version=%latest_version:~1%
)

:: Compare versions
for /f "tokens=1,2 delims=." %%a in ('echo %latest_version% ^| findstr /i /v "v"') do set latest_major=%%a
for /f "tokens=1,2 delims=." %%a in ('echo %latest_version% ^| findstr /i /v "v"') do set latest_minor=%%b
for /f "tokens=1,2 delims=." %%a in ('echo %latest_version% ^| findstr /i /v "v"') do set latest_patch=%%c

if "%latest_major%" EQU "" (
    set latest_major=0
)
if "%latest_minor%" EQU "" (
    set latest_minor=0
)
if "%latest_patch%" EQU "" (
    set latest_patch=0
)

for /f "usebackq delims=" %%a in ("%~dp0product_version.txt") do set version=%%a

if "%version%" EQU "" (
    set version=v0.0.0
)

echo Current version: %version%

if "%version:~0,1%" EQU "v" (
    set version=%version:~1%
)

for /f "tokens=1,2 delims=." %%a in ('echo %version% ^| findstr /i /v "v"') do set current_major=%%a
for /f "tokens=1,2 delims=." %%a in ('echo %version% ^| findstr /i /v "v"') do set current_minor=%%b
for /f "tokens=1,2 delims=." %%a in ('echo %version% ^| findstr /i /v "v"') do set current_patch=%%c

if "%current_major%" EQU "" (
    set current_major=0
)
if "%current_minor%" EQU "" (
    set current_minor=0
)
if "%current_patch%" EQU "" (
    set current_patch=0
)

if %current_major% LSS %latest_major% (
    echo New major version available: v%latest_version%
    echo Please download the latest version from %manual_download_url%
) else if %current_minor% LSS %latest_minor% (
    echo New minor version available: v%latest_version%
    echo Please download the latest version from %manual_download_url%
) else if %current_patch% LSS %latest_patch% (
    echo New patch version available: v%latest_version%
    echo Please download the latest version from %manual_download_url%
) else (
    echo You are using the latest version: v%version%
)

endlocal
goto :eof

