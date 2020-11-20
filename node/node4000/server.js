'use strict';

const express = require('express');

// Constants
const PORT = 4000;
const HOST = '0.0.0.0';

// App

var os = require("os");
var hostname = os.hostname();

const app = express();
app.get('/', (req, res) => {
  res.send("Hello from:" + hostname + "\n port:4000");
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
