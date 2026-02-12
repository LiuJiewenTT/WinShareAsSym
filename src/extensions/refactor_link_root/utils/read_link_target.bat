@echo off
call "%~dp0process_params_match_mode.bat" %* >nul
@REM echo Match mode: %match_mode%
@REM echo Shift cnt: %shift_cnt%
:shifting_step
if /I %shift_cnt% GTR 0 (
    shift /1
    set /a shift_cnt=shift_cnt-1
    @REM echo shift
    goto :shifting_step
)

if /I "%match_mode%" EQU "file_first" (
    set first_suffix=file
    set second_suffix=dir
) else if /I "%match_mode%" EQU "dir_first" (
    set first_suffix=dir
    set second_suffix=file
) else (
    @REM runtime error
    exit /b 2
)

set retv=
call "%~dp0read_link_target_for_%first_suffix%.bat" "%~1"
if not defined retv (
    call "%~dp0read_link_target_for_%second_suffix%.bat" "%~1"
)
