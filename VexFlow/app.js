"use strict"

// Main app appendChordControl

// Global variables;
let server = 'http://localhost:3000/';
let ec = new elementControl();
let vc = new vexflowControl();

function runApp()
{
  // Set up VexFlow using app_vexflow.js
  vc.VexFlowInit('vex1', 240, 100);
  vc.drawStave(1, 1, 235);

  // Get roman names as a json object
  fetch(server + 'data/RomanNames')
    .then(response => {return response.json()}).then(items => setupRomanNames(items))
    .catch(err => console.error(err));

  // Get key signatures
  fetch(server + 'data/Keys')
    .then(response => {return response.json()}).then(items => setupKeys(items))
    .catch(err => console.error(err));

}

function setupKeys(items)
{
  ec.appendSpacerSpan('key1', 40);
  ec.appendKeyControl('key1', items, vc);
  ec.appendSpacerSpan('key1', 30);
}

function setupRomanNames(items)
{
  //ec.appendSpacerSpan('ctrl1', 100);
  ec.appendRomanNameControl('roman1', items, vc);
  ec.appendSpacerSpan('roman1', 30);
  ec.appendRomanNameControl('roman2', items, vc);
}
