if "%~1" EQU "" (
    set /p target_dir="请输入目标目录的路径："  
) else (
    set target_dir=%~1
)
echo 目标目录: %target_dir% 
if not exist "%target_dir%" (
    echo 目标目录不存在！
    exit /B 1
)

set pre_selection=%~2
echo.
echo 1. 文件符号链接 
echo 2. 目录符号链接 
echo 3. 文件硬链接 
echo 4. 目录软联结 
echo.
if "%pre_selection%" EQU "" (
    choice /c 1234 /n /m "请选择符号链接类型："
) else (
    echo %pre_selection%|choice /c 1234 /n /m "请选择符号链接类型："
)

if ERRORLEVEL 4 (
    copy /Y "%~dp0..\create_dir_sym_j.bat" "%target_dir%"
) else if ERRORLEVEL 3 (
    copy /Y "%~dp0..\create_file_sym_h.bat" "%target_dir%"
) else if ERRORLEVEL 2 (
    copy /Y "%~dp0..\create_dir_sym.bat" "%target_dir%"
) else if ERRORLEVEL 1 (
    copy /Y "%~dp0..\create_file_sym.bat" "%target_dir%"
) 


