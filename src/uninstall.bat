@echo off

@REM Set codepage to UTF-8(65001)
@for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
@if /I %codepage% NEQ 65001 ( 
    echo [INFO]: Active code page is not 65001^(UTF-8^). [%codepage%]
    chcp 65001
)

@echo Uninstaller of WinShareAsSym
@echo.
@echo Project Link: https://github.com/LiuJiewenTT/WinShareAsSym
@echo.
@echo Author: LiuJiewenTT
@echo.
@echo Email: ^<liuljwtt@163.com^>
@echo.
@echo Version: 1.0.1
@echo.
@echo License: LGPLv3 License ^(Copyright ^(c^) 2026 LiuJiewenTT^)
@echo.
@echo ---

echo 正在移除右键菜单... 

:: 删除一级菜单 
reg delete "HKCR\Directory\shell\WinShareAsSym" /f

echo 移除完成！ 
pause
