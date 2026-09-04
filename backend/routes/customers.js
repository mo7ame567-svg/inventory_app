import express from 'express';
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: "Get all customers" });
});

export default router;
