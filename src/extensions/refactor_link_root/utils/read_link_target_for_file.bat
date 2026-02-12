@setlocal enabledelayedexpansion
@echo off
@REM Version: 1.0.0
set retv=
set line=

set "para1=%~1"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] para1=【!para1!】 1>&2)

call :get_var_nx "%para1%"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] para1^(~nx^)=【!retv!】 1>&2)

@for /f "usebackq eol= delims=" %%i in (`dir /A:-DL "%para1%" ^| findstr /L /C:" %retv% "`) do @(
    set "line=%%i"
)
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] line=【!line!】 1>&2)
if "%line%" EQU "" (
    goto :end
)

for /f "tokens=2,3 delims=[]" %%i in ("!line!") do (
    if /I "%%j" EQU "" (
        if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] Use easier method to read. 1>&2)
        set "retv=%%i"
        goto :end
    )
)

call "%~dp0str\strip.bat" " " 0 "%line%"
set "line=%retv%"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] line=【!line!】 1>&2)
if "%line%" EQU "" (
    goto :end
)

call "%~dp0str\len.bat" "%line%"
set /a "line_len=%retv%"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] line_len=【!line_len!】 1>&2)

set /a square_cnt=0
set /a ptr=-1
set flag_met_square_sign=false

:loop1

set "char=!line:~%ptr%,1!"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] char=【!char!】 1>&2)

if "%char%" EQU "" (
    goto :end
) 

if "%char%" EQU "]" (
    set /a square_cnt+=1
    set flag_met_square_sign=true
) else if "%char%" EQU "[" (
    set /a square_cnt-=1
) 

if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] square_cnt=【!square_cnt!】 1>&2)

if "%square_cnt%" EQU "0" if "%flag_met_square_sign%" EQU "true" (
    set "retv=!line:~%ptr%,-1!"
    set "retv=!retv:~1!"
    goto :end
)

set /a ptr-=1

if /I %ptr% LSS -%line_len% (
    goto :end
)

goto :loop1 

:end
if /I "%retv%" NEQ "" (
    echo !retv!
)
@REM if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] retv=【!retv!】 1>&2)
if not defined retv (
    exit /b 1
)
@endlocal & set "retv=%retv%"
@exit /b 0

:get_var_nx
    set "retv=%~nx1"
@goto :eof
