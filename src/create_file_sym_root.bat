@echo off
@echo Create symlinks for all files passed in, under the directory where this batch file is located.
@echo Paths will be relative to current root/drive.
@echo.
@echo Usage: create_file_sym_root.bat file1 [file2 file3...]
@echo.
@echo Example: create_file_sym_root.bat c:\windows\system32\notepad.exe c:\windows\system32\calc.exe
@echo.
@echo This will create two relative symlinks in the current directory, notepad.exe and calc.exe, pointing to the corresponding files in the Windows system directory. Paths start with '\' separator.
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
call :get_root_path "%source_file%"
mklink "%~dp0%source_filename%" "%retv%"
shift /1
if "%~1" NEQ "" (goto loop) else (goto:eof)

:get_root_path
    set "retv=%~pnx1"
goto:eof