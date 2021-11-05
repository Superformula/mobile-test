import express from 'express';
import GenerateCode from './src/generate_qrcode.js';
import ValidateUser from './src/validate_user.js';

// ROUTES FOR OUR API
const router = express.Router();

const GenqrCode = new GenerateCode();
const Uservail = new ValidateUser();

router.get('/generate_code', (req, res) => {
  const body = GenqrCode.fetchcode(req.query['id']);
  res.json({ body });
});

router.get('/user_val', (req, res) => {
  Uservail.isvalid(req.query,res);
});


export default router;