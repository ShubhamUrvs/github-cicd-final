const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('<h1>CI/CD Pipeline is Working!</h1><p>Successfully deployed via GitHub Actions.</p>');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
