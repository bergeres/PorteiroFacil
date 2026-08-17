@echo off
setlocal
cd /d "%~dp0"
echo ========================================
echo Porteiro Facil - Gerar APK DEBUG
echo ========================================
echo.

if exist gradlew.bat (
    call gradlew.bat :app:assembleDebug
    goto :result
)

where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    gradle :app:assembleDebug
    goto :result
)

echo ERRO: Gradle Wrapper nao esta completo e o comando gradle nao esta no PATH.
echo.
echo Abra esta pasta no Android Studio e use o menu:
echo Build ^> Generate Bundle(s) / APK(s) ^> Generate APK(s)
echo.
echo IMPORTANTE: os sinais ^> acima sao apenas separadores do MENU.
echo NAO digite ^> no Terminal.
pause
exit /b 1

:result
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo A compilacao falhou. Veja a mensagem acima.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo APK gerado em:
echo app\build\outputs\apk\debug\app-debug.apk
echo.
pause
