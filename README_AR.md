# 📦 نظام إدارة المخزون المتكامل

نظام متكامل لإدارة المخزون يدعم المشتريات والمبيعات والمرتجعات والتقارير المالية.

## 🎯 المميزات الرئيسية

### 1. إدارة الأصناف
- إضافة وتعديل وحذف الأصناف
- تحديد سعر الشراء والبيع
- تحديد الحد الأدنى للمخزون
- تصنيف الأصناف

### 2. إدارة الموردين والعملاء
- تسجيل الموردين والعملاء
- تتبع الرصيد المستحق
- كشف حساب لكل مورد/عميل

### 3. المشتريات والمبيعات
- تسجيل فواتير الشراء
- تسجيل فواتير المبيعات
- تحديث المخزون تلقائياً
- تطبيق الخصومات

### 4. المرتجعات
- مرتجع المشتريات (خصم من المخزون)
- مرتجع المبيعات (إضافة للمخزون)

### 5. المخزون
- عرض رصيد المخزون الحالي
- تنبيهات الأصناف الناقصة
- قيمة المخزون الإجمالية

### 6. التقارير
- تقرير المخزون الحالي
- الأصناف الناقصة
- الأرباح
- إحصائيات اليوم

### 7. لوحة التحكم
- عدد الأصناف
- قيمة المخزون
- مبيعات واشتريات اليوم
- الأصناف الناقصة

## 📁 هيكل المشروع

```
inventory_app/
├── backend/
│   ├── models/
│   │   ├── Product.js      (نموذج الأصناف)
│   │   ├── Supplier.js     (نموذج الموردين)
│   │   ├── Customer.js     (نموذج العملاء)
│   │   ├── Purchase.js     (نموذج المشتريات)
│   │   ├── Sale.js         (نموذج المبيعات)
│   │   ├── Return.js       (نموذج المرتجعات)
│   │   └── Inventory.js    (نموذج المخزون والتقارير)
│   ├── routes/
│   │   ├── products.js
│   │   ├── suppliers.js
│   │   ├── customers.js
│   │   ├── purchases.js
│   │   ├── sales.js
│   │   ├── returns.js
│   │   └── reports.js
│   ├── server.js           (السيرفر الرئيسي)
│   ├── package.json
│   └── .env
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Dashboard.jsx    (لوحة التحكم)
│   │   │   ├── Products.jsx     (إدارة الأصناف)
│   │   │   ├── Suppliers.jsx    (إدارة الموردين)
│   │   │   ├── Customers.jsx    (إدارة العملاء)
│   │   │   ├── Purchases.jsx    (إدارة المشتريات)
│   │   │   ├── Sales.jsx        (إدارة المبيعات)
│   │   │   ├── Returns.jsx      (إدارة المرتجعات)
│   │   │   ├── Inventory.jsx    (عرض المخزون)
│   │   │   └── Reports.jsx      (التقارير)
│   │   ├── App.jsx
│   │   ├── App.css
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
└── README.md
```

## 🚀 كيفية التشغيل

### 1. تثبيت المتطلبات

**Backend:**
```bash
cd backend
npm install
```

**Frontend:**
```bash
cd frontend
npm install
```

### 2. تشغيل السيرفر

**Backend (في فولدر backend):**
```bash
npm start
# أو
node server.js
```

السيرفر سيعمل على `http://localhost:5000`

**Frontend (في فولدر frontend):**
```bash
npm run dev
```

التطبيق سيفتح على `http://localhost:5173`

## 📊 API المتاحة

### الأصناف
- `GET /api/products` - الحصول على جميع الأصناف
- `POST /api/products` - إضافة صنف جديد
- `GET /api/products/:id` - الحصول على صنف
- `PUT /api/products/:id` - تحديث صنف
- `DELETE /api/products/:id` - حذف صنف

### الموردين
- `GET /api/suppliers` - جميع الموردين
- `POST /api/suppliers` - إضافة مورد
- `DELETE /api/suppliers/:id` - حذف مورد

### العملاء
- `GET /api/customers` - جميع العملاء
- `POST /api/customers` - إضافة عميل
- `DELETE /api/customers/:id` - حذف عميل

### المشتريات
- `GET /api/purchases` - جميع فواتير الشراء
- `POST /api/purchases` - إضافة فاتورة شراء
- `DELETE /api/purchases/:id` - حذف فاتورة

### المبيعات
- `GET /api/sales` - جميع فواتير المبيعات
- `POST /api/sales` - إضافة فاتورة مبيعات
- `POST /api/sales/:id/pay` - تسديد فاتورة

### المرتجعات
- `GET /api/returns` - جميع المرتجعات
- `POST /api/returns/purchase-return` - مرتجع مشتريات
- `POST /api/returns/sales-return` - مرتجع مبيعات

### التقارير
- `GET /api/reports` - تقرير المخزون الكامل
- `GET /api/reports/low-stock/items` - الأصناف الناقصة
- `GET /api/reports/stats/today` - إحصائيات اليوم
- `POST /api/reports/profits` - الأرباح

## 💾 تخزين البيانات

البيانات تُحفظ في ملفات JSON:
- `backend/data/products.json`
- `backend/data/suppliers.json`
- `backend/data/customers.json`
- `backend/data/purchases.json`
- `backend/data/sales.json`
- `backend/data/returns.json`

## 🎨 الواجهة

- تصميم احترافي مع sidebar navigation
- ألوان متناسقة (بنفسجي وأبيض)
- responsive design
- رسوم بيانية واضحة
- رموز تعبيرية (emojis)

## 🔒 ملاحظات الأمان

- تحقق من صحة البيانات المُدخلة
- استخدم HTTPS في الإنتاج
- أضف authentication و authorization
- استخدم قاعدة بيانات حقيقية (MongoDB/MySQL)

## 📈 التحسينات المستقبلية

- [ ] إضافة نظام المستخدمين والصلاحيات
- [ ] استخدام قاعدة بيانات حقيقية
- [ ] تقارير متقدمة مع رسوم بيانية
- [ ] نظام الفواتير الإلكترونية
- [ ] تطبيق Mobile
- [ ] نظام الباركود
- [ ] تكامل مع أنظمة الدفع

## 📝 الترخيص

هذا المشروع متاح للاستخدام الحر.

## 📧 التواصل والدعم

للأسئلة والدعم، يرجى التواصل عبر البريد الإلكتروني.

---

تم إنشاؤه بواسطة Copilot ✨
