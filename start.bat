@echo off
chcp 65001 >nul
echo ================================
echo  🌳 三星堆青铜神树 - 启动中...
echo ================================
echo.

REM 检查Node.js是否安装
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo ❌ 未检测到Node.js，请先安装Node.js
  echo 下载地址：https://nodejs.org/
  pause
  exit /b 1
)

REM 启动服务器
start http://localhost:8080
node server.js

pause
