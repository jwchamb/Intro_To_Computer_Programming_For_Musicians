"use strict"

var express = require('express')
var app = express()
var con = require('./web_db_connect.js')

// Server local port
app.listen(3000)

con.openDB();

// Route to use the static app webpage
app.use('/', express.static('../VexFlow'))

// Data endpoints for postgres calls
app.get('/data/RomanNames', (req, res) => con.sendRomanNames(res))
app.get('/data/Keys', (req, res) => con.sendKeys(res))
app.get('/data/ChordStructure/:chord', (req, res) => con.sendChordStructure(req, res))
