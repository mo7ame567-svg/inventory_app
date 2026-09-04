#!/bin/bash
# ========================================
# ملف البدء السريع - Quick Start Script
# ========================================

echo "🚀 نظام إدارة المخزون المتكامل"
echo "=================================="
echo ""

# تحقق من npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm غير مثبت. الرجاء تثبيت Node.js"
    exit 1
fi

echo "✅ npm موجود"
echo ""

# ========================================
# تثبيت Backend
# ========================================
echo "📦 تثبيت Backend..."
cd backend

if [ ! -d "node_modules" ]; then
    echo "تثبيت المتطلبات..."
    npm install
    echo "✅ تم تثبيت Backend"
else
    echo "✅ Backend مثبت مسبقاً"
fi

cd ..
echo ""

# ========================================
# تثبيت Frontend
# ========================================
echo "📦 تثبيت Frontend..."
cd frontend

if [ ! -d "node_modules" ]; then
    echo "تثبيت المتطلبات..."
    npm install
    echo "✅ تم تثبيت Frontend"
else
    echo "✅ Frontend مثبت مسبقاً"
fi

cd ..
echo ""

# ========================================
# إنشاء مجلد البيانات
# ========================================
echo "📁 إعداد مجلد البيانات..."
if [ ! -d "backend/data" ]; then
    mkdir backend/data
    echo "✅ تم إنشاء مجلد البيانات"
else
    echo "✅ مجلد البيانات موجود"
fi

echo ""
echo "=================================="
echo "✨ تم الإعداد بنجاح!"
echo "=================================="
echo ""
echo "🎯 الخطوة التالية:"
echo "1. فتح Terminal 1 وتشغيل: cd backend && npm start"
echo "2. فتح Terminal 2 وتشغيل: cd frontend && npm run dev"
echo ""
echo "🌐 سيفتح التطبيق على: http://localhost:5173"
echo "🔌 السيرفر سيعمل على: http://localhost:5000"
echo ""
