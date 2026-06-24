@echo off
title HTMLedger Setup
color 0A

echo.
echo  ^<HTMLedger/^> Setup
echo  ================================
echo.

:: Check Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Node.js is not installed.
    echo.
    echo  Download it from: https://nodejs.org
    echo  Install the LTS version, then re-run this script.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VER=%%i
echo  [OK] Node.js %NODE_VER% found
echo.

:: Check npm
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] npm not found. Reinstall Node.js.
    pause
    exit /b 1
)

:: Install dependencies
echo  Installing dependencies...
echo.
call npm install
if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] npm install failed. Check the output above.
    pause
    exit /b 1
)

echo.
echo  [OK] Dependencies installed.
echo.
echo  ================================
echo   Setup complete!
echo  ================================
echo.

set /p LAUNCH=" Launch HTMLedger now? (Y/N): "
if /i "%LAUNCH%"=="Y" (
    echo.
    echo  Starting HTMLedger...
    start "" "node_modules\.bin\electron.cmd" .
)

echo.
echo  To launch later, run:
echo    node_modules\.bin\electron.cmd .
echo.
echo  To build the installer, run:
echo    node_modules\.bin\electron-builder.cmd --win --x64
echo.
pause
