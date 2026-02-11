@echo off
@echo Create symlinks for all directories passed in, under the directory where this batch file is located.
@echo.
@echo Usage: create_dir_sym.bat file1 [file2 file3...]
@echo.
@echo Example: create_dir_sym.bat "F:\My Documents\Learning\Python" "E:\My Music\Rock"
@echo.
@echo This will create two symlinks, "Python" and "Rock", in the current directory. One for "F:\My Documents\Learning\Python" and one for "E:\My Music\Rock".
@echo.
@echo Project Link: https://github.com/LiuJiewenTT/WinShareAsSym
@echo.
@echo Author: LiuJiewenTT
@echo.
@echo Email: ^<liuljwtt@163.com^>
@echo.
@echo Version: 1.0.1
@echo.
@echo License: LGPLv3 License ^(Copyright ^(c^) 2026 LiuJiewenTT^)
@echo.
@echo ---

if "%~1"=="" goto:eof

:loop
set "source_file=%~1"
set "source_filename=%~nx1"
mklink /D "%~dp0%source_filename%" "%source_file%"
shift /1
if "%~1" NEQ "" (goto loop) else (goto:eof)