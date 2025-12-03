const express = require('express');
// const bodyParser = require('body-parser');
// const notesRouter = require('./routes/notes');

const app = express();

app.get('/', (req, res) => res.jsoin({ message: "Hellow from notebooks"}));
app.listen(3000, () => console.log('Server is running on port 3000'));