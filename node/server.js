'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App

var os = require("os");
var hostname = os.hostname();

const app = express();
app.get('/', (req, res) => {
  res.send("Hello from:" + hostname);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);