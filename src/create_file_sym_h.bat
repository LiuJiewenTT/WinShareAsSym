@echo off
@echo Create hard links for all files passed in, under the directory where this batch file is located.
@echo.
@echo Usage: create_file_sym_h.bat file1 [file2 file3...]
@echo.
@echo Example: create_file_sym_h.bat c:\windows\system32\notepad.exe c:\windows\system32\calc.exe
@echo.
@echo This will create two hard links in the current directory, notepad.exe and calc.exe, pointing to the corresponding files in the Windows system directory.
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
mklink /H "%~dp0%source_filename%" "%source_file%"
shift /1
if not "%~1"=="" goto loop