@setlocal
@echo off
@REM This is a batch script to remove the last character of a string.
@REM Usage: remove_first_char.bat [first_char] [string]
@REM retv: (str) The result string.
@REM para1: (str) The last character to remove.
@REM para2: (str) The count of characters to remove.
@REM para3: (str) The string to remove characters from.


set retv=
set "para1=%~1"
set "para2=%~2"
set "para3=%~3"

set /a cnt=0

if /I "%para3%" EQU "" (
    goto :end
) 

set /a "max_cnt=%para2%"

if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] max_cnt=【%max_cnt%】 )

:loop

if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] para3=【%para3%】 )

if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] last_char=【%para3:~-1%】 )

if "%para3:~-1%" EQU "%para1%" (
    set "para3=%para3:~0,-1%"
    set /a cnt+=1
) else (
    goto :end
)

if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] cnt=【%cnt%】 )

if /I "%max_cnt%" GTR "0" if /I "%cnt%" GEQ "%max_cnt%" (
    if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] cnt=【%cnt%】 hits max_cnt=【%max_cnt%】 )
    goto :end
)

if /I "%para3%" NEQ "" (
    goto :loop
)

:end
set "retv=%para3%" 
if /I "%flag_wasa_debug_mode%" EQU "true" (echo [DEBUG] retv=【%retv%】 )
@endlocal && set "retv=%retv%"
