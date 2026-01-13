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

@REM If you change the first 4 options' order, you will have to make a mapping, which is important for receiving correct selection from right-click menu.

set pre_selection=%~2
echo.
echo 1. 文件符号链接 
echo 2. 目录符号链接 
echo 3. 文件硬链接 
echo 4. 目录软联结 
echo 5. 文件符号链接（相对于驱动器） 
echo 6. 目录符号链接（相对于驱动器） 
echo.
if "%pre_selection%" EQU "" (
    choice /c 123456 /n /m "请选择要添加的类型或工具："
) else (
    echo %pre_selection%|choice /c 123456 /n /m "请选择要添加的类型或工具："
)


if ERRORLEVEL 6 (
    copy /Y "%~dp0..\..\..\create_dir_sym_root.bat" "%target_dir%\create_dir_sym_root.bat"
) else if ERRORLEVEL 5 (
    copy /Y "%~dp0..\..\..\create_file_sym_root.bat" "%target_dir%\create_file_sym_root.bat"
) else if ERRORLEVEL 4 (
    copy /Y "%~dp0..\..\..\create_dir_sym_j.bat" "%target_dir%\create_dir_sym_j.bat"
) else if ERRORLEVEL 3 (
    copy /Y "%~dp0..\..\..\create_file_sym_h.bat" "%target_dir%\create_file_sym_h.bat"
) else if ERRORLEVEL 2 (
    copy /Y "%~dp0..\..\..\create_dir_sym.bat" "%target_dir%\create_dir_sym.bat"
) else if ERRORLEVEL 1 (
    copy /Y "%~dp0..\..\..\create_file_sym.bat" "%target_dir%\create_file_sym.bat"
) 


