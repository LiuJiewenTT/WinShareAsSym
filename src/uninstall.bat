@echo off

@REM Set codepage to UTF-8(65001)
@for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
@if /I %codepage% NEQ 65001 ( 
    echo [INFO]: Active code page is not 65001^(UTF-8^). [%codepage%]
    chcp 65001
)

echo 正在移除右键菜单... 

:: 删除一级菜单 
reg delete "HKCR\Directory\Background\shell\WinShareAsSym" /f

:: 删除子菜单组 
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\WinShareAsSymGroup" /f

echo 移除完成！ 
pause
