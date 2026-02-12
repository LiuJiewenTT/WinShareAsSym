@REM Version: 1.0.0
set retv=
@for /f "usebackq eol= tokens=2 delims=<>" %%i in (`dir /A:DL "%~f1\.." ^| findstr /C:" %~nx1 "`) do @(
    echo %%i
    set "retv=%%i"
)
if not defined retv (
    exit /b 1
)
@exit /b 0 
