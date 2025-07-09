const db = require('../db');

exports.submitApplication = (req, res) => {
  const { jobId } = req.body;
  const name = (req.body.name || '').trim();
  const email = (req.body.email || '').trim();
  const resumeFile = req.file;
  const userId = req.user?.id;

  if (!userId || !jobId || !resumeFile || !name || !email) {
    return res.status(400).json({ message: 'All fields are required.' });
  }

  const resumePath = resumeFile.filename;

  const sql = 'INSERT INTO applications (user_id, job_id, resume, name, email) VALUES (?, ?, ?, ?, ?)';
  db.query(sql, [userId, jobId, resumePath, name, email], (err, result) => {
    if (err) {
      return res.status(500).json({ message: 'Database error' });
    }
    res.status(200).json({ message: '✅ Application submitted successfully' });
  });
};
