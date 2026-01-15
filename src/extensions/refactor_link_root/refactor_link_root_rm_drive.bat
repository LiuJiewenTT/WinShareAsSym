@echo off
@echo Remove drive letter and colon from the from a link's path.
@echo During the processing, the original link will be renamed to ^<original_name^>.wsas_temp, which will not be deleted until a second time execution of this script on the same original link.  
@echo.
@echo Usage: refactor_link_root_rm_drive.bat file1 [file2 file3...]
@echo.
@echo Example: refactor_link_root_rm_drive.bat "F:\My Documents\Learning\Python"
@echo.
@echo This will remove the drive letter and colon from the path, leaving only the relative path. The original link will be renamed to Python.wsas_temp.
@echo.
@echo Project Link: https://github.com/LiuJiewenTT/WinShareAsSym
@echo.
@echo Author: LiuJiewenTT
@echo.
@echo Email: ^<liuljwtt@163.com^>
@echo.
@echo Version: 1.0
@echo.
@echo License: MIT License ^(Copyright ^(c^) 2025 LiuJiewenTT^)
@echo.
@echo ---

if "%~1"=="" goto:eof

set kit_root=%~dp0..\..\

:loop
set source_file=%~1
set source_filename=%~nx1
set source_dirname=%~dp1
echo Source file: %source_file% 
echo Target directory: %source_dirname%
set link_type=
set link_target_original= 
if not exist "%source_file%" (
    echo Original file does not exist now. Skip.
    goto :main_continue
) 
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_type.bat" "%source_file%"`) do set link_type=%%i
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_target.bat" "%source_file%"`) do set link_target_original=%%i
echo Link type: %link_type%
echo Link target ^(original^): %link_target_original%
set prefix=%link_target_original:~0,2%
set rest=%link_target_original:~2%
set drive_original=%prefix:~0,1%
set link_target_new=
if "%prefix:~1,2%" NEQ ":" (
    echo The link target does not start with a drive letter and colon.
    goto :main_continue
)
echo Drive letter ^(original^): %drive_original% 
set link_target_new=%rest%
if /I "%link_type%" EQU "SYMLINK" (
    echo Link is for a file.
    set mklink_option=
    if exist "%source_file%.wsas_temp" (
    echo Temporary symbolic link for file already exists. Remove.
        del /f /A:L "%source_file%.wsas_temp" 
        if ERRORLEVEL 1 (
            echo Failed to delete temporary symbolic link. Skip.
        )
    )
) else if /I "%link_type%" EQU "SYMLINKD" (
    echo Link is for a directory.
    set mklink_option=/D
    if exist "%source_file%.wsas_temp" (
        echo Temporary symbolic link for directory already exists. Remove.
        rmdir "%source_file%.wsas_temp" 
        if ERRORLEVEL 1 (
            echo Failed to delete temporary symbolic link. Skip.
        )
    )
) else (
    echo Unsupported link type: %link_type%. Skip.
    goto :main_continue
)
ren "%source_file%" "%source_filename%.wsas_temp"
if ERRORLEVEL 1 (
    echo Failed to rename the original file ^(create backup^). Skip.
    goto :main_continue
) 
mklink %mklink_option% "%source_file%" "%link_target_new%"
if ERRORLEVEL 1 (
    echo Failed to create new symbolic link. Restore and abort.
    ren "%source_file%.wsas_temp" "%source_filename%"
    if ERRORLEVEL 1 (
        echo Failed to restore the original file name. Abort.
    )
    goto :eof
)
:main_continue
shift /1
if not "%~1"=="" goto loop else goto:eof

