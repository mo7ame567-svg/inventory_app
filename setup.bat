@echo off
REM ========================================
REM ملف التشغيل السريع لنظام إدارة المخزون
REM ========================================

setlocal enabledelayedexpansion
cd /d "%~dp0"

cls
echo.
echo ========================================
echo   نظام إدارة المخزون المتكامل
echo   Inventory Management System
echo ========================================
echo.

where npm >nul 2>nul
if errorlevel 1 (
    echo ❌ npm غير مثبت. الرجاء تثبيت Node.js من: https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ npm موجود
echo.
REM إغلاق أي عمليات Node قديمة على المنفذ المطلوب
for /f "tokens=5" %%a in ('netstat -ano -p tcp ^| findstr :5001') do (
    taskkill /F /PID %%a >nul 2>&1
)
for /f "tokens=5" %%a in ('netstat -ano -p tcp ^| findstr :8080') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo 📦 التحقق من Backend...
if not exist "backend\node_modules" (
    echo تثبيت Backend...
    cd backend
    call npm install
    if errorlevel 1 (
        echo ❌ فشل تثبيت Backend
        pause
        exit /b 1
    )
    cd ..
    echo ✅ تم تثبيت Backend
) else (
    echo ✅ Backend مثبت مسبقاً
)

echo.
echo 📦 التحقق من Frontend...
if not exist "frontend\node_modules" (
    echo تثبيت Frontend...
    cd frontend
    call npm install
    if errorlevel 1 (
        echo ❌ فشل تثبيت Frontend
        pause
        exit /b 1
    )
    cd ..
    echo ✅ تم تثبيت Frontend
) else (
    echo ✅ Frontend مثبت مسبقاً
)

if not exist "backend\data" (
    mkdir backend\data
    echo ✅ تم إنشاء مجلد البيانات
) else (
    echo ✅ مجلد البيانات موجود
)

echo.
echo 🚀 بدء السيرفر الرئيسي...
start "Inventory Backend" cmd /k "cd /d "%~dp0backend" && node server.js"

echo 🚀 بدء الواجهة الأمامية...
start "Inventory Frontend" cmd /k "cd /d "%~dp0frontend" && powershell -ExecutionPolicy Bypass -Command "node .\node_modules\vite\bin\vite.js --host 0.0.0.0 --port 8080""

echo.
echo ========================================
echo ✨ تم تشغيل التطبيق بنجاح!
echo ========================================
echo.
echo 🌐 رابط التطبيق: http://localhost:8080
echo 🔌 رابط API: http://localhost:5001
echo.
echo 👤 بيانات الدخول الافتراضية:
echo    المستخدم: admin
echo    كلمة المرور: admin123
echo.
echo ✅ لإغلاق السيرفرات استخدم نافذة CMD الخاصة بكل خدمة ثم Ctrl+C
pause
