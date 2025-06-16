const express = require('express');
const router = express.Router();

// Health check endpoint
router.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', message: 'Service is healthy' });
});

// Example API endpoint
router.get('/info', (req, res) => {
  res.json({
    name: 'DevOps Demo App',
    version: '1.0.0',
    description: 'A simple Node.js app for DevOps demonstration.'
  });
});

module.exports = router;
