const express = require('express');

const app = express();
const port = 3000;
const users = [];

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Hello world!');
});

// Get registered users
app.get('/users', (req, res) => {
    return res.json({ users });
});

// Register a new user
app.post('/users', (req, res) => {
    const newUserId = req.body.userId;
    
    if (!newUserId || typeof newUserId !== 'string') {
        return res.status(400).send('Missing or invalid userId.');
    }

    if (users.includes(newUserId)) {
        return res.status(400).send('userId already exists.');
    }

    users.push(newUserId);
    return res.status(201).send('User registered.');
});

app.listen(port, '0.0.0.0', () => {
    console.log(`Server listening on port ${port}`);
});