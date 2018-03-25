"use strict"

// Broswer functions to create HTML elements
// The functions need a vexflowControl instance passed as an argument

class elementControl
{
  constructor()
  {
      this._selectSize = 10;
  }

  appendKeyControl(elementId, items, vc)
  {
    let e = document.getElementById(elementId);
    let s = document.createElement('select');
    s.setAttribute('size', this._selectSize);
    this._buildOptions(s, items);
    s.onchange = function ()
    {
      vc.newKeySig(e.id, s.value, s.options[s.selectedIndex].text);
    }
    return e.appendChild(s);
  }

  appendRomanNameControl(elementId, items, vc)
  {
    let e = document.getElementById(elementId);
    let s = document.createElement('select');
    s.setAttribute('size', this._selectSize);
    this._buildOptions(s, items);
    s.onchange = function ()
    {
      vc.getChord(e.id, s.value, s.options[s.selectedIndex].text);
    }
    return e.appendChild(s);
  }

  appendSpacerSpan(elementId, width)
  {
    let e = document.getElementById(elementId);
    let s = document.createElement('span');
    s.setAttribute('style', 'display: inline-block; width: ' + width);
    return e.appendChild(s);
  }

  _buildDummyOptions(e)
  {
    let n;
    for (let i = 1; i < 12; i++)
    {
      n = e.appendChild(document.createElement('option'));
      n.appendChild(document.createTextNode(i));
    }
  }

  // Callback for database query. 'items' is a json object of {id:<num>, name:<text>}
  _buildOptions(e, items)
  {
    let n;
    for (let i of items)
    {
      n = e.appendChild(document.createElement('option'));
      n.setAttribute('text', i.name);
      n.setAttribute('value', i.value);
      n.appendChild(document.createTextNode(i.name));
    }
  }
}
