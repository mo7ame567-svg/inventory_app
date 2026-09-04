# 🔧 دليل استكشاف الأخطاء والصيانة

## 🚨 مشاكل شائعة والحلول

### المشكلة 1: خطأ "EADDRINUSE: address already in use :::5000"

**السبب:** المنفذ 5000 مستخدم بالفعل

**الحل:**
```bash
# الخيار 1: قتل العملية على المنفذ 5000
# Windows:
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Mac/Linux:
lsof -ti:5000 | xargs kill -9

# الخيار 2: استخدام منفذ مختلف
# عدّل في server.js:
const PORT = process.env.PORT || 5001; // بدلاً من 5000
```

### المشكلة 2: خطأ "Cannot find module 'express'"

**السبب:** المكتبات غير مثبتة

**الحل:**
```bash
cd backend
npm install
# أو
npm install express cors dotenv
```

### المشكلة 3: Frontend يظهر "Cannot GET /api/..."

**السبب:** Backend لا يعمل أو الـ URL خاطئة

**التحقق:**
1. تأكد أن Backend يعمل: `npm start` في مجلد backend
2. تحقق من الـ console في DevTools (F12)
3. تأكد من CORS مفعل

**الحل:**
```javascript
// في server.js:
app.use(cors()); // يجب أن تكون موجودة
```

### المشكلة 4: البيانات لا تحفظ

**السبب:** مجلد data لم ينشأ

**الحل:**
```bash
# أنشئ المجلد يدويً:
mkdir backend/data

# أو اترك النظام ينشئه تلقائياً:
# احفظ صنف واحد وسينشئ الملف تلقائياً
```

### المشكلة 5: الصفحة بيضاء في Frontend

**السبب:** خطأ في المكون أو عدم تحميل المكتبات

**التحقق:**
1. افتح DevTools (F12)
2. انظر للأخطاء في Console
3. تأكد من `npm run dev`

**الحل:**
```bash
cd frontend
npm install
npm run dev
```

### المشكلة 6: "CORS error"

**السبب:** Backend و Frontend على منافذ مختلفة ولم يتم تفعيل CORS

**الحل في server.js:**
```javascript
const cors = require('cors');
app.use(cors()); // قبل الـ routes

// أو مع خيارات محددة:
app.use(cors({
  origin: 'http://localhost:5173',
  credentials: true
}));
```

---

## 🔄 إعادة ضبط المشروع من الصفر

### الخطوة 1: حذف البيانات القديمة
```bash
# حذف مجلد data
rm -rf backend/data

# أو يدويً: اذهب لـ backend/data وحذف جميع ملفات .json
```

### الخطوة 2: حذف node_modules وإعادة تثبيت
```bash
# Backend:
cd backend
rm -rf node_modules package-lock.json
npm install

# Frontend:
cd frontend
rm -rf node_modules package-lock.json
npm install
```

### الخطوة 3: تشغيل جديد
```bash
# في Terminal 1:
cd backend
npm start

# في Terminal 2:
cd frontend
npm run dev
```

---

## 📊 التحقق من صحة النظام

### اختبار 1: هل السيرفر يعمل؟
```bash
# اختبر هذا الـ URL في المتصفح:
http://localhost:5000/api/test

# يجب أن تحصل على:
{"message":"✅ السيرفر شغال!"}
```

### اختبار 2: هل يمكن إضافة صنف؟
```bash
# استخدم curl:
curl -X POST http://localhost:5000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "code": "TEST",
    "name": "اختبار",
    "unit": "وحدة",
    "minStock": 10,
    "buyPrice": 10,
    "sellPrice": 15,
    "category": "اختبار"
  }'

# يجب أن تحصل على رد بـ id وجميع البيانات
```

### اختبار 3: هل تظهر الأصناف؟
```bash
curl http://localhost:5000/api/products

# يجب أن تحصل على array من الأصناف
```

---

## 🛠️ الصيانة الدورية

### كل أسبوع:
- [ ] نسخة احتياطية من ملفات data
- [ ] حذف الفواتير القديمة (اختياري)
- [ ] فحص الأصناف الناقصة

### كل شهر:
- [ ] عمل نسخة احتياطية كاملة
- [ ] فحص الأرباح والخسائر
- [ ] تحديث الأسعار إذا لزم

### كل 3 شهور:
- [ ] تحديث المكتبات: `npm update`
- [ ] فحص شامل للنظام

---

## 💾 نسخ احتياطي آمن

### الطريقة اليدوية:
```bash
# انسخ مجلد data:
cp -r backend/data backend/data_backup_$(date +%Y%m%d)

# على Windows:
# انسخ مجلد data يدويً وأعد تسميته
```

### النسخ الآلي (اختياري):
يمكنك إضافة سكريبت تلقائي في package.json:
```json
{
  "scripts": {
    "backup": "cp -r backend/data backend/data_backup_$(date +%Y%m%d)"
  }
}
```

---

## 📝 الملفات الهامة وموقعها

### Backend:
- `server.js` - نقطة الدخول الرئيسية
- `models/` - منطق البيانات
- `routes/` - API endpoints
- `data/` - ملفات JSON

### Frontend:
- `App.jsx` - المكون الرئيسي
- `components/` - المكونات الفرعية
- `App.css` - التصميم الرئيسي
- `main.jsx` - نقطة البدء

---

## 🔍 تصحيح الأخطاء المتقدمة

### الخطأ: "TypeError: Cannot read property '...' of undefined"

**السبب:** محاولة الوصول لخاصية في object فارغ

**الحل:**
```javascript
// بدل هذا:
const name = product.name;

// استخدم هذا:
const name = product?.name || 'غير معروف';

// أو:
if (product) {
  const name = product.name;
}
```

### الخطأ: "ReferenceError: ... is not defined"

**السبب:** استخدام متغير لم يتم تعريفه

**الحل:**
1. تحقق من تهجية اسم المتغير
2. تأكد أنك تستورده من الملف الصحيح
3. تأكد من أنه معرّف قبل الاستخدام

### الخطأ: "JSON.parse: unexpected character"

**السبب:** ملف JSON معيب

**الحل:**
1. حذف الملف المعيب من مجلد data
2. النظام سينشئ نسخة جديدة تلقائياً
3. أعد إدخال البيانات

---

## 🆘 متى تطلب المساعدة

اجمع هذه المعلومات قبل طلب المساعدة:

1. رسالة الخطأ الكاملة
2. متى يحدث الخطأ (عند فتح الصفحة/بعد تسجيل عملية/إلخ)
3. ما الذي حاولت فعله
4. خطوات إعادة الخطأ
5. لقطة شاشة من DevTools

---

## 🎯 نصائح الأداء

1. **تجنب البيانات الكبيرة:**
   - لا تحفظ آلاف الفواتير في ملف JSON واحد
   - استخدم قاعدة بيانات حقيقية للإنتاج

2. **حسّن المتصفح:**
   - امسح cache (Ctrl+Shift+Del)
   - استخدم متصفح محدث
   - أغلق التبويبات الأخرى

3. **تحسين الكود:**
   - استخدم React DevTools
   - تجنب الـ re-renders غير الضرورية
   - استخدم useMemo/useCallback

---

## 📚 المراجع المفيدة

- [Express.js Docs](https://expressjs.com/)
- [React Docs](https://react.dev/)
- [MDN Web Docs](https://developer.mozilla.org/)
- [Node.js Docs](https://nodejs.org/docs/)

---

## ✅ قائمة التحقق الأخيرة

- [ ] السيرفر يعمل على 5000
- [ ] Frontend يعمل على 5173
- [ ] CORS مفعل
- [ ] مجلد data موجود
- [ ] المكتبات مثبتة
- [ ] لا توجد أخطاء في Console
- [ ] البيانات تحفظ بنجاح
- [ ] جميع المكونات تحمل

---

**آخر تحديث: 1 سبتمبر 2026**
**تم إعداده بواسطة: GitHub Copilot ✨**
