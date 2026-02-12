@REM @echo off
@REM Version: 1.0.0
set match_mode=
set /a shift_cnt=0
:loop_start
if /I "%~1" EQU "/ff" (
    @REM File first
    @REM echo File first
    set match_mode=file_first
    shift /1
    set /a shift_cnt=shift_cnt+1
    goto :loop_start
) else if /I "%~1" EQU "/df" (
    @REM Directory first
    @REM echo Directory first
    set match_mode=dir_first
    shift /1
    set /a shift_cnt=shift_cnt+1
    goto :loop_start
) else (
    if not defined match_mode (
        @REM default is ff
        @REM echo Use default: ff
        set match_mode=file_first
    )
)
echo %shift_cnt%
exit /b %shift_cnt%
