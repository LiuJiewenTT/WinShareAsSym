@setlocal
@echo off
@REM Version: 1.0.0
@REM retv: (None)
@REM exit code: (integer) 0 if the string is blank, 1 otherwise.
@REM para1: (str) the string to be checked


set retv=
set "para1=%~1"
for /f "" %%i in ("%para1%") do (
    set "retv=%%i"
    @REM not equals to blank and tab
    if /I "%%i" NEQ " " if /I "%%i" NEQ "	" (
        goto :break
    )
)
:break
if not defined retv (
    exit /b 0
) else (
    if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG]: not blank 1>&2)
    exit /b 1
)
@endlocal