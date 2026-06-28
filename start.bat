@echo off
chcp 65001 >nul
echo ================================
echo  🏛️  三星堆文化数字展示平台 - 启动中...
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

REM 启动服务器（后台）
start /b node server.js

REM 等待服务器启动
echo 正在启动服务器，请稍候...
timeout /t 3 >nul

REM 打开浏览器
start http://localhost:8080

echo.
echo ✅ 服务器已启动！
echo    请关闭此窗口以停止服务器。
echo.

REM 保持服务器运行（前台阻塞）
node server.js

pause
