@echo off
chcp 65001 >nul
echo ============================================
echo   Sanxingdui 3D Viewer - Starting...
echo ============================================
echo.

REM Kill any process using port 8088
for /f "tokens=5" %%a in ('netstat -ano 2^>nul ^| findstr :8088') do (
  taskkill /f /pid %%a >nul 2>nul
)

REM Try Python first
where python >nul 2>nul
if %errorlevel% == 0 (
  echo [OK] Python found, starting server...
  start "Sanxingdui Server" cmd /k "python server-cors.py"
  goto OPEN
)

REM Try Node.js as fallback
where node >nul 2>nul
if %errorlevel% == 0 (
  echo [OK] Node.js found, starting server...
  start "Sanxingdui Server" cmd /k "node server-node.js"
  goto OPEN
)

echo.
echo [ERROR] Python or Node.js not found!
echo.
echo Please install one of them:
echo   Python:  https://www.python.org/downloads/
echo   Node.js: https://nodejs.org/
echo.
echo Make sure to check "Add to PATH" during installation.
echo Then run this file again.
echo.
pause
exit /b 1

:OPEN
echo Waiting for server...
timeout /t 3 >nul
echo Opening browser...
start http://localhost:8088
echo.
echo ============================================
echo   Started! Open: http://localhost:8088
echo   Close server window to stop.
echo ============================================
echo.
pause
