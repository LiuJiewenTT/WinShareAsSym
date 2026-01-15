set retv=
@for /f "usebackq eol= tokens=2 delims=[]" %%i in (`dir /A:-DL "%~1"`) do @(
    echo %%i
    set retv=%%i
)
if /I "%retv%" EQU "" (
    @for /f "usebackq eol= tokens=2 delims=[]" %%i in (`dir /A:DL "%~1\.."`) do @(
        echo %%i
        set retv=%%i
    )
)
