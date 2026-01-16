@echo off
@echo Restore previous version of link.
@echo Need ^<original_name^>.wsas_temp exists and current file is a link.
@echo.
@echo Usage: refactor_link_root_undo.bat file1 [file2 file3...]
@echo.
@echo Example: refactor_link_root_undo.bat "F:\My Documents\Learning\Python"
@echo.
@echo This will remove the current link and restore the backup. The original link was renamed to Python.wsas_temp.
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

:loop
set source_file=%~1
set source_filename=%~nx1
set source_dirname=%~dp1
echo Source file: %source_file% 
echo Target directory: %source_dirname%
set link_type_current=
set link_target_current= 
set link_type_backup=
set link_target_backup= 
if not exist "%source_file%" (
    echo Original file does not exist now. Skip.
    goto :main_continue
) 
if not exist "%source_file%.wsas_temp" (
    echo Original backup file does not exist now. Skip.
    goto :main_continue
) 
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_type.bat" "%source_file%"`) do set link_type_current=%%i
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_target.bat" "%source_file%"`) do set link_target_current=%%i
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_type.bat" "%source_file%.wsas_temp"`) do set link_type_backup=%%i
for /f "usebackq delims=" %%i in (`call "%~dp0utils\read_link_target.bat" "%source_file%.wsas_temp"`) do set link_target_backup=%%i

echo Link type ^(current^): %link_type_current%
echo Link target ^(current^): %link_target_current%
echo Link type ^(backup^): %link_type_backup%
echo Link type ^(backup^): %link_target_backup%
if /I "%link_type_current%" EQU "SYMLINK" (
    call :rename_tasks "%source_file%"
    if ERRORLEVEL 2 (exit /b 2) else if ERRORLEVEL 1 (goto :main_continue)
    del /f /A:L "%source_file%.wsas_temp2"
    if ERRORLEVEL 1 (
        echo Current file ^(backup^) cannot be deleted. Skip.
        goto :main_continue
    )
) else if /I "%link_type_current%" EQU "SYMLINKD" (
    call :rename_tasks "%source_file%"
    if ERRORLEVEL 2 (exit /b 2) else if ERRORLEVEL 1 (goto :main_continue)
    rmdir "%source_file%.wsas_temp2"
    if ERRORLEVEL 1 (
        echo Current file ^(backup^) cannot be deleted. Skip.
        goto :main_continue
    )
) else (
    echo Unsupported link type: %link_type_current%. Skip.
    goto :main_continue
)
echo Undo success.
:main_continue
shift /1
if "%~1" NEQ "" (goto :loop) else (goto:eof)


@REM @retv[0]: normal
@REM @retv[1]: skip
@REM @retv[2]: abort
:rename_tasks
    set source_file=%~1
    set source_filename=%~nx1
    ren "%source_file%" "%source_filename%.wsas_temp2"
    if ERRORLEVEL 1 (
        echo Backup current file failed. Skip.
        exit /b 1
    )
    ren "%source_file%.wsas_temp" "%source_filename%"
    if ERRORLEVEL 1 (
        echo Backup file cannot be renamed. Restore backup of current file.
        ren "%source_file%.wsas_temp2" "%source_filename%"
        if ERRORLEVEL 1 (
            echo Failed to restore backup of current file name. Abort.
            exit /b 2
        )
        exit /b 1
    )
goto:eof
