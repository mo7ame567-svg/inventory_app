import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

import productsRouter from './routes/products.js';
import customersRouter from './routes/customers.js';
import suppliersRouter from './routes/suppliers.js';
import salesRouter from './routes/sales.js';
import purchasesRouter from './routes/purchases.js';
import returnsRouter from './routes/returns.js';
import reportsRouter from './routes/reports.js';
import usersRouter from './routes/users.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/products', productsRouter);
app.use('/api/customers', customersRouter);
app.use('/api/suppliers', suppliersRouter);
app.use('/api/sales', salesRouter);
app.use('/api/purchases', purchasesRouter);
app.use('/api/returns', returnsRouter);
app.use('/api/reports', reportsRouter);
app.use('/api/users', usersRouter);

app.get('/', (req, res) => {
  res.send('API is running...');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
