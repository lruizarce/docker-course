const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const Port = 3000;

app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('Hello, World!');
});