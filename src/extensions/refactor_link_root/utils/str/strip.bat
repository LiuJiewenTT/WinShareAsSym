@setlocal
@echo off
@REM This is a batch script to remove the first character of a string.
@REM Usage: strip.bat [first_and_last_char] [max_cnt_to_remove] [string]
@REM Version: 1.0.0
@REM retv: (str) The result string.
@REM para1: (str) The first and last character to remove.
@REM para2: (integer) The count of characters to remove on both ends.
@REM para3: (str) The string to remove characters from.

set retv=
set "para1=%~1"
set "para2=%~2"
set "para3=%~3"

call "%~dp0lstrip.bat" "%para1%" "%para2%" "%para3%"
call "%~dp0rstrip.bat" "%para1%" "%para2%" "%retv%"

@endlocal & set "retv=%retv%"
