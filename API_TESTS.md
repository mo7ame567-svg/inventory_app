// ملف اختبار API - استخدم Postman أو curl

// ===============================================
// 1️⃣ اختبار الأصناف (Products)
// ===============================================

// إضافة صنف جديد
POST http://localhost:5000/api/products
Content-Type: application/json

{
  "code": "P001",
  "name": "تمر تمري",
  "unit": "كيس",
  "weight": "500g",
  "minStock": 50,
  "buyPrice": 20,
  "sellPrice": 35,
  "category": "أغذية",
  "currentStock": 100
}

// الحصول على جميع الأصناف
GET http://localhost:5000/api/products

// الحصول على صنف واحد
GET http://localhost:5000/api/products/1

// ===============================================
// 2️⃣ اختبار الموردين (Suppliers)
// ===============================================

// إضافة مورد
POST http://localhost:5000/api/suppliers
Content-Type: application/json

{
  "code": "S001",
  "name": "محل النور",
  "phone": "0501234567",
  "address": "الرياض"
}

// الحصول على جميع الموردين
GET http://localhost:5000/api/suppliers

// ===============================================
// 3️⃣ اختبار العملاء (Customers)
// ===============================================

// إضافة عميل
POST http://localhost:5000/api/customers
Content-Type: application/json

{
  "code": "C001",
  "name": "متجر الفرقان",
  "phone": "0509876543",
  "address": "جدة"
}

// ===============================================
// 4️⃣ اختبار المشتريات (Purchases)
// ===============================================

// إضافة فاتورة شراء
POST http://localhost:5000/api/purchases
Content-Type: application/json

{
  "invoiceNumber": "INV001",
  "date": "2026-09-01",
  "supplierId": 1,
  "items": [
    {
      "productId": 1,
      "quantity": 50,
      "price": 20,
      "discount": 0
    }
  ]
}

// ===============================================
// 5️⃣ اختبار المبيعات (Sales)
// ===============================================

// إضافة فاتورة مبيعات
POST http://localhost:5000/api/sales
Content-Type: application/json

{
  "invoiceNumber": "SALE001",
  "date": "2026-09-01",
  "customerId": 1,
  "items": [
    {
      "productId": 1,
      "quantity": 10,
      "price": 35,
      "discount": 0
    }
  ],
  "paid": false
}

// تسديد فاتورة
POST http://localhost:5000/api/sales/1/pay
Content-Type: application/json

{
  "paidAmount": 350
}

// ===============================================
// 6️⃣ اختبار المرتجعات (Returns)
// ===============================================

// مرتجع مشتريات
POST http://localhost:5000/api/returns/purchase-return
Content-Type: application/json

{
  "referenceInvoice": "INV001",
  "date": "2026-09-01",
  "supplierId": 1,
  "reason": "تالفة",
  "items": [
    {
      "productId": 1,
      "quantity": 5,
      "price": 20,
      "discount": 0
    }
  ]
}

// مرتجع مبيعات
POST http://localhost:5000/api/returns/sales-return
Content-Type: application/json

{
  "referenceInvoice": "SALE001",
  "date": "2026-09-01",
  "customerId": 1,
  "reason": "عدم الرضا",
  "items": [
    {
      "productId": 1,
      "quantity": 2,
      "price": 35,
      "discount": 0
    }
  ]
}

// ===============================================
// 7️⃣ اختبار التقارير (Reports)
// ===============================================

// تقرير المخزون الكامل
GET http://localhost:5000/api/reports

// الأصناف الناقصة
GET http://localhost:5000/api/reports/low-stock/items

// مخزون صنف واحد
GET http://localhost:5000/api/reports/product/1

// إحصائيات اليوم
GET http://localhost:5000/api/reports/stats/today

// الأرباح
POST http://localhost:5000/api/reports/profits
Content-Type: application/json

{
  "startDate": "2026-09-01",
  "endDate": "2026-09-01"
}

// ===============================================
// 📝 ملاحظات الاختبار
// ===============================================

/*
1. استخدم curl من Terminal:
   curl -X GET http://localhost:5000/api/products

2. أو استخدم Postman:
   - افتح Postman
   - أنشئ request جديد
   - انسخ أحد الـ requests أعلاه

3. التأكد من:
   - السيرفر يعمل (npm start)
   - URLs صحيحة
   - Content-Type: application/json

4. الاختبار الكامل:
   1. أضف صنف
   2. أضف مورد
   3. أضف عميل
   4. أضف فاتورة شراء
   5. أضف فاتورة مبيعات
   6. عرض التقارير
*/

// ===============================================
// 🐚 أوامر CURL (Terminal)
// ===============================================

/*
إضافة صنف:
curl -X POST http://localhost:5000/api/products \
  -H "Content-Type: application/json" \
  -d '{
    "code": "P001",
    "name": "تمر",
    "unit": "كيس",
    "minStock": 50,
    "buyPrice": 20,
    "sellPrice": 35,
    "category": "أغذية",
    "currentStock": 100
  }'

عرض الأصناف:
curl http://localhost:5000/api/products

حذف صنف:
curl -X DELETE http://localhost:5000/api/products/1
*/

// ===============================================
// ✅ النتائج المتوقعة
// ===============================================

/*
الصنف بعد الإضافة:
{
  "id": 1,
  "code": "P001",
  "name": "تمر تمري",
  "unit": "كيس",
  "weight": "500g",
  "minStock": 50,
  "buyPrice": 20,
  "sellPrice": 35,
  "category": "أغذية",
  "currentStock": 100,
  "createdAt": "2026-09-01T10:00:00.000Z"
}

الأصناف:
[
  {
    "id": 1,
    "code": "P001",
    "name": "تمر تمري",
    ...
  }
]

التقرير:
{
  "productId": 1,
  "productName": "تمر تمري",
  "unit": "كيس",
  "currentStock": 88,
  "stockValue": 1760,
  "minStock": 50,
  "isLow": false,
  "totalIn": 50,
  "totalOut": 10,
  "totalReturned": 2
}
*/
