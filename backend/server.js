const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const path = require('path');
const db = require('./db');

const jobRoutes = require('./routes/jobRoutes');
const applyRoutes = require('./routes/applyRoutes');
const authRoutes = require('./routes/authRoutes');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());


app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use('/uploads/logo', express.static(path.join(__dirname, 'uploads/logo')));

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


app.use('/api/jobs', jobRoutes);
app.use('/api/apply', applyRoutes);
app.use('/api/auth', authRoutes);


app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
});
