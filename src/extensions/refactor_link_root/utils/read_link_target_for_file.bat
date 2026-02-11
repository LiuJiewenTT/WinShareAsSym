@setlocal enabledelayedexpansion
@echo off
set retv=
set line=
@for /f "usebackq eol= delims=" %%i in (`dir /A:-DL "%~1" ^| findstr /L /C:" %~nx1 "`) do @(
    set line=%%i
)
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] line=【!line!】 )

call "%~dp0str\strip.bat" " " 0 "%line%"
set "line=%retv%"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] line=【!line!】 )

set /a square_cnt=0
set /a ptr=-1
set flag_met_square_sign=false

:loop1

set "char=!line:~%ptr%,1!"
if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] char=【!char!】 )

if "%char%" EQU "" (
    goto :end
) 

if "%char%" EQU "]" (
    set /a square_cnt+=1
    set flag_met_square_sign=true
) else if "%char%" EQU "[" (
    set /a square_cnt-=1
) 

if /I "%flag_wsas_debug_mode%" EQU "true" (echo [DEBUG] square_cnt=【!square_cnt!】 )

if "%square_cnt%" EQU "0" if "%flag_met_square_sign%" EQU "true" (
    set "retv=!line:~%ptr%,-1!"
    goto :end
)

set /a ptr-=1

goto :loop1 

:end
if /I "%retv%" NEQ "" (
    set "retv=!retv:~1!"
    echo !retv!
)
if not defined retv (
    exit /b 1
)
@endlocal & set "retv=%retv%"
