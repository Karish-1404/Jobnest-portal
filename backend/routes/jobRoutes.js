const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');

const { postJob, getJobs, getJobById } = require('../controllers/jobController');
const authenticateToken = require('../middleware/authMiddleware');


const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '..', 'uploads', 'logo')); 
  },
  filename: function (req, file, cb) {
    const uniqueName = Date.now() + '-' + file.originalname.replace(/\s+/g, '-');
    cb(null, uniqueName);
  }
});

const upload = multer({
  storage: storage,
  limits: { fileSize: 5 * 1024 * 1024 }, 
  fileFilter: function (req, file, cb) {
    const ext = path.extname(file.originalname).toLowerCase();
    if (ext === '.jpg' || ext === '.jpeg' || ext === '.png') {
      cb(null, true);
    } else {
      cb(new Error('Only JPG, JPEG, or PNG images are allowed'));
    }
  }
});


router.get('/all', getJobs);


router.post('/post', upload.single('logo'), authenticateToken, postJob);


router.get('/:id', getJobById);

module.exports = router;
