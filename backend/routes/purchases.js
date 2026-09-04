import express from 'express';
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: "Get all purchases" });
});

export default router;
