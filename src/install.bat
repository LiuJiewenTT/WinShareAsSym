@echo off
setlocal

@REM Set codepage to UTF-8(65001)
@for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
@if /I %codepage% NEQ 65001 ( 
    echo [INFO]: Active code page is not 65001^(UTF-8^). [%codepage%]
    chcp 65001
)

:: 获取当前脚本所在目录 
set "CURDIR=%~dp0"
:: 去掉末尾的反斜杠 
set "CURDIR=%CURDIR:~0,-1%"

echo 正在注册右键菜单...

:: 主菜单 
reg add "HKCR\Directory\shell\WinShareAsSym" /v "MUIVerb" /d "创建链接" /f
reg add "HKCR\Directory\shell\WinShareAsSym" /v "SubCommands" /f
reg add "HKCR\Directory\shell\WinShareAsSym" /v "Icon" /d "%SystemRoot%\System32\imageres.dll,-5302" /f

:: 定义子菜单组 
set "GROUPBASE=HKCR\Directory\shell\WinShareAsSym\Shell"

:: 子菜单 - 文件符号链接 
reg add "%GROUPBASE%\SymFile" /v "MUIVerb" /d "文件符号链接" /f
reg add "%GROUPBASE%\SymFile" /v "ShowDisabledIfHidden" /t REG_SZ /f
reg add "%GROUPBASE%\SymFile\command" /ve /d "\"%CURDIR%\creation_wizard\wizard.bat\" \"%%V\" 1" /f

:: 子菜单 - 目录符号链接 
reg add "%GROUPBASE%\SymDir" /v "MUIVerb" /d "目录符号链接" /f
reg add "%GROUPBASE%\SymDir" /v "ShowDisabledIfHidden" /t REG_SZ /f
reg add "%GROUPBASE%\SymDir\command" /ve /d "\"%CURDIR%\creation_wizard\wizard.bat\" \"%%V\" 2" /f

:: 子菜单 - 文件硬链接 
reg add "%GROUPBASE%\HardLink" /v "MUIVerb" /d "文件硬链接" /f
reg add "%GROUPBASE%\HardLink" /v "ShowDisabledIfHidden" /t REG_SZ /f
reg add "%GROUPBASE%\HardLink\command" /ve /d "\"%CURDIR%\creation_wizard\wizard.bat\" \"%%V\" 3" /f

:: 子菜单 - 目录联接(Junction) 
reg add "%GROUPBASE%\Junction" /v "MUIVerb" /d "目录软联接" /f
reg add "%GROUPBASE%\Junction" /v "ShowDisabledIfHidden" /t REG_SZ /f
reg add "%GROUPBASE%\Junction\command" /ve /d "\"%CURDIR%\creation_wizard\wizard.bat\" \"%%V\" 4" /f

:: 子菜单 - 向导 
reg add "%GROUPBASE%\Wizard" /v "MUIVerb" /d "启动生成向导" /f
reg add "%GROUPBASE%\Wizard" /v "ShowDisabledIfHidden" /t REG_SZ /f
reg add "%GROUPBASE%\Wizard\command" /ve /d "\"%CURDIR%\creation_wizard\wizard.bat\" \"%%V\" " /f

echo 注册完成！ 
pause
