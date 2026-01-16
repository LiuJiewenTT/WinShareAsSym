set retv=
@for /f "usebackq eol= tokens=2 delims=<>" %%i in (`dir /A:-DL "%~1" ^| findstr /C:" %~nx1 "`) do @(
    echo %%i
    set retv=%%i
)
if not defined retv (
    exit /b 1
)
