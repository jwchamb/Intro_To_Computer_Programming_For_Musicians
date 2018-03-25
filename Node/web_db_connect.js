"use strict"

// Server functions to pull postgres data and send to web client
// The server passes in the send-to-browswer callback function

const pgp = require('pg-promise')()

const cn = {
  host: '192.168.0.11', // 'localhost' is the default;
  port: 5432, // 5432 is the default;
  database: 'joel',
  user: 'final_app',
  password: 'final_app'
}

let db;

exports.openDB = function () {if (!db) db = pgp(cn)}

exports.getDB = function () {return db;}

// Shut down all connection pools
exports.closeDB = function () {pgp.end();}

// Return data to the browser using the Express server respons object
exports.sendRomanNames = function (response)
{
  db.func('final_project.get_roman_names')
    .then(function(data) {response.send(data)})
    .catch(function(err) {console.error(err)})
}

exports.sendKeys = function (response)
{
  db.func('final_project.get_key_signatures')
    .then(function(data) {response.send(data)})
    .catch(function(err) {console.error(err)})
}

exports.sendChordStructure = function(request, response)
{
  db.func('final_project.get_chord_structure', [request.params.chord])
    .then(function(data) {response.send(data)})
    .catch(function(error) {console.error(error)})
}
