if "%~1" EQU "" (
    set /p target_dir="请输入目标目录的路径："  
) else (
    set target_dir=%~1
)
echo 目标目录: %target_dir% 

:sym_type_select_loop

echo 1. 文件符号链接 
echo 2. 目录符号链接 
echo 3. 文件硬链接 
echo 4. 目录软联结 
echo.
set /p sym_type_no="请输入数字选择符号链接类型："

if "%sym_type_no%" EQU "1" (
    copy "%~dp0create_file_sym.bat" "%target_dir%"
) else if "%sym_type_no%" EQU "2" (
    copy "%~dp0create_dir_sym.bat" "%target_dir%"
) else if "%sym_type_no%" EQU "3" (
    copy "%~dp0create_file_sym_h.bat" "%target_dir%"
) else if "%sym_type_no%" EQU "4" (
    copy "%~dp0create_dir_sym_j.bat" "%target_dir%"
) else if "%sym_type_no%" EQU "" (
    echo 未输入任何内容，程序退出。
    goto :eof 
) else (
    echo 无效的选项，请重新输入正确的数字。 
    echo.
    goto :sym_type_select_loop
)


