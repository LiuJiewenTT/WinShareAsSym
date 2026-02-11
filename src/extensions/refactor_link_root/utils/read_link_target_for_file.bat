set retv=
set token_3=
set line=
set str_length=
set offset=
@for /f "usebackq eol= delims=" %%i in (`dir /A:-DL "%~1" ^| findstr /L /C:" %~nx1 "`) do @(
    set line=%%i
)
echo "line=%line%"
@for /f "usebackq tokens=2,* delims=[]" %%i in (`echo "%line%"`) do @(
    echo %%i
    set retv=%%i
    set token_3=%%j
)
@REM remove tailing " sign. 
@ if defined token_3 (
    set token_3=%token_3:~,-1%
)
@ if not defined token_3 (
    goto:end
)
echo "token_3=%token_3%"

set /a offset=0
echo "%line%" | findstr /L /O /C:" %~nx1 "
@for /f "usebackq tokens=1 delims=:" %%i in (`echo "%line%" ^| findstr /L /O /C:" %~nx1 "`) do @(
    echo %%i
    set /a offset=%%i-1
)
echo "offset=%offset%"
@for /f "usebackq tokens=1 delims=:" %%i in (`echo "%~nx1%:" ^| findstr /L /O /C:":"`) do @(
    set /a offset=%offset%+%%i-1
)
echo "offset=%offset%"
set "retv=%line:~%offset%,-1%"
echo %retv%

:end
if not defined retv (
    exit /b 1
)
