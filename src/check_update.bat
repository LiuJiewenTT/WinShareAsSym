@echo off
setlocal

set latest_version=

set manual_download_url=https://github.com/LiuJiewenTT/WinShareAsSym/releases
set api_url=https://api.github.com/repos/LiuJiewenTT/WinShareAsSym/releases/latest
echo Checking for updates... ^(Release only^)

:: Check for updates
for /f "tokens=1,2 delims=:" %%a in ('curl -sL %api_url% ^| findstr /i "tag_name"') do set latest_version=%%b

:: local test version
@REM set latest_version= "v1.0-beta",

if "%latest_version%" EQU "" (
    echo Failed to fetch remote latest version.
    exit /b 1
)

set latest_version=%latest_version: =%
set latest_version=%latest_version:"=%
set latest_version=%latest_version:,=%

if "%latest_version%" EQU "" (
    echo Failed to fetch remote latest version.
    exit /b 1
)

echo Lastest version: %latest_version%

for /f "tokens=1 delims=-" %%a in ("%latest_version%") do set latest_version=%%a

if "%latest_version%" EQU "" (
    echo Failed to check for updates.
    exit /b 1
)

if "%latest_version:~0,1%" EQU "v" (
    set latest_version=%latest_version:~1%
)

:: Compare versions
set /a latest_major=0
set /a latest_minor=0
set /a latest_patch=0

for /f "tokens=1,2,3,* delims=." %%a in ('echo %latest_version% ^| findstr /i /v "v"') do (
    if "%%a" NEQ "" (set /a latest_major=%%a)
    if "%%b" NEQ "" (set /a latest_minor=%%b)
    if "%%c" NEQ "" (set /a latest_patch=%%c)
    if "%%d" NEQ "" (echo Found unknown version info from remote.)
)

@REM echo latest version: %latest_major%.%latest_minor%.%latest_patch%

for /f "usebackq delims=" %%a in ("%~dp0product_version.txt") do set version=%%a

if "%version%" EQU "" (
    set version=v0.0.0
)

echo Current version: %version%

for /f "tokens=1 delims=-" %%a in ("%version%") do set version=%%a

if "%version:~0,1%" EQU "v" (
    set version=%version:~1%
)

set /a current_major=0
set /a current_minor=0
set /a current_patch=0

for /f "tokens=1,2,3 delims=." %%a in ('echo %version% ^| findstr /i /v "v"') do (
    if "%%a" NEQ "" (set /a current_major=%%a)
    if "%%b" NEQ "" (set /a current_minor=%%b)
    if "%%c" NEQ "" (set /a current_patch=%%c)
)

@REM echo version: %current_major%.%current_minor%.%current_patch%

if /I %current_major% LSS %latest_major% (
    echo New major version available: v%latest_version%
    echo Please download the latest version from %manual_download_url%
) else if /I %current_major% GTR %latest_major% (
    echo Lower major version found: v%latest_major%
    echo You are using a higher version than the remote released version.
) else (
    @REM %current_major% EQU %latest_major%
    if /I %current_minor% LSS %latest_minor% (
        echo New minor version available: v%latest_version%
        echo Please download the latest version from %manual_download_url%
    ) else if /I %current_minor% GTR %latest_minor% (
        echo Lower minor version found: v%latest_version%
        echo You are using a higher version than the remote released version.
    ) else (
        @REM %current_minor% EQU %latest_minor%
        if /I %current_patch% LSS %latest_patch% (
            echo New patch version available: v%latest_version%
            echo Please download the latest version from %manual_download_url%
        ) else if /I %current_patch% GTR %latest_patch% (
            echo Lower patch version found: v%latest_version%
            echo You are using a higher version than the remote released version.
        ) else (
            @REM %current_patch% EQU %latest_patch%
            echo You are using the latest version: v%version%
        )
    )
)



endlocal
goto :eof

