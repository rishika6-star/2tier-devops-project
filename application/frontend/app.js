const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

// MySQL Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST || 'mysql-db',
    user: process.env.DB_USER || 'app_user',
    password: process.env.DB_PASSWORD || 'app_pass',
    database: process.env.DB_NAME || 'app_db'
});

db.connect((err) => {
    if (err) {
        console.error('❌ DB connection failed:', err);
        return;
    }
    console.log('✅ Connected to MySQL');
});

// Routes
app.get('/', (req, res) => {
    res.send('Backend is running 🚀');
});

// Get Users
app.get('/users', (req, res) => {
    db.query('SELECT * FROM users', (err, results) => {
        if (err) return res.status(500).json(err);
        res.json(results);
    });
});

// Get Products
app.get('/products', (req, res) => {
    db.query('SELECT * FROM products', (err, results) => {
        if (err) return res.status(500).json(err);
        res.json(results);
    });
});

// Add User
app.post('/users', (req, res) => {
    const { name, email } = req.body;
    db.query(
        'INSERT INTO users (name, email) VALUES (?, ?)',
        [name, email],
        (err, result) => {
            if (err) return res.status(500).json(err);
            res.json({ message: 'User added', id: result.insertId });
        }
    );
});

app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
});
