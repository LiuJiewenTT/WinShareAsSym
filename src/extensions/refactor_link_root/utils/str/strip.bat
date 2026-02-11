@setlocal
@echo off
@REM This is a batch script to remove the first character of a string.
@REM Usage: remove_first_char.bat [first_char] [string]
@REM retv: (str) The result string.
@REM para1: (str) The first character to remove.
@REM para2: (str) The count of characters to remove.
@REM para3: (str) The string to remove characters from.

set retv=
set "para1=%~1"
set "para2=%~2"
set "para3=%~3"

call "%~dp0lstrip.bat" "%para1%" "%para2%" "%para3%"
call "%~dp0rstrip.bat" "%para1%" "%para2%" "%retv%"

@endlocal & set "retv=%retv%"
