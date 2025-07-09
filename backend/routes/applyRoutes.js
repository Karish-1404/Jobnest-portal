const express = require('express');
const multer = require('multer');
const path = require('path');
const { submitApplication } = require('../controllers/applyController');


const authenticateToken = require('../middleware/authMiddleware');

const router = express.Router();

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    const uniqueName = Date.now() + '-' + file.originalname;
    cb(null, uniqueName);
  }
});

const upload = multer({ storage });


router.post('/', authenticateToken, upload.single('resume'), submitApplication);

module.exports = router;
