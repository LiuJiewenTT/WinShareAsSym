@setlocal enabledelayedexpansion
@echo off
@REM retv: (integer) the length of the string
@REM exit code: (integer) the length of the string
@REM para1: (str) the string to be checked


set retv=
set "para1=%~1"
set /a cnt=0

:loop

if /I "%para1%" NEQ "" (
    set /a cnt+=1
    set "para1=%para1:~1%"
    goto :loop 
)

if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] cnt=【!cnt!】 1>&2)
set retv=%cnt%

@endlocal & set "retv=%retv%"
exit /b %retv%
