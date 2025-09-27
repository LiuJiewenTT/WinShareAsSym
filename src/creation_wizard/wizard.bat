@echo off
setlocal

@REM Set codepage to UTF-8(65001)
@for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
@call :func_ensureACP
REM 已设定代码页，如遇乱码请检查文件编码或终端字体，通常可以得到解决。 
REM 若仍有乱码，请检查文件是否是UTF-8编码，且换行符是CRLF模式。 

echo WinShareAsSym 脚本创建向导 
@echo.
@echo Project Link: https://github.com/LiuJiewenTT/WinShareAsSym
@echo.
@echo Author: LiuJiewenTT
@echo.
@echo Email: ^<liuljwtt@163.com^>
@echo.
@echo Product Version: 1.1
@echo.
@echo Version: 1.0
@echo.
@echo License: MIT License ^(Copyright ^(c^) 2025 LiuJiewenTT^)
@echo.
@echo ---

if "%LANG%" == "" (
:use_default_lang
    for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName') do set LANG=%%a
)

if not exist "%~dp0i18n\%LANG%\wizard.bat" (
    echo [LOG]: Language %LANG% not supported. Use default language.
    goto :use_default_lang
)

call "%~dp0i18n\%LANG%\wizard.bat" %*

endlocal
@ goto:eof

@REM # func_ensureACP
:func_ensureACP
    @if /I %codepage% NEQ 65001 ( 
        echo [LOG]: Active code page is not 65001^(UTF-8^). [%codepage%]
        chcp 65001
    )
@ goto:eof
