@echo off
setlocal

echo [%date% %time%] launcher.cmd started >> "%~dp0soar-dispatch-cmd.log"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0soar-dispatch.ps1" >> "%~dp0soar-dispatch-cmd.log" 2>&1

echo [%date% %time%] launcher.cmd finished (exit code %errorlevel%) >> "%~dp0soar-dispatch-cmd.log"
exit /b %errorlevel%
