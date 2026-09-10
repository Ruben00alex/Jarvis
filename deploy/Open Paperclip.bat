@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0open-paperclip.ps1"
if errorlevel 1 (
    echo.
    echo Could not connect. See the message above and docs/access.md.
    pause
    exit /b 1
)
start "" "http://localhost:3100/JAR/dashboard"
