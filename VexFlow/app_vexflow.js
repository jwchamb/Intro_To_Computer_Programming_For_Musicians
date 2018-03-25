"use strict"

// Vexflow music calligraphy stuff for browser

class vexflowControl
{
  // TODO: The scale lists would be better in the database

  constructor()
  {
    this._VF = Vex.Flow;
    this._keyName = 'C';
    this._keyOffset = 0;
    this._scaleOctave = 4;
    this._keyMajorScale = [0, 2, 4, 5, 7, 9, 11];
    this._keyMinorScale = [0, 2, 3, 5, 7, 8, 10];
    this._keyCurrentScale;
    this._keySharpAcc = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B'];
    this._keyFlatAcc = ['C','Db','D','Eb','E','F','Gb','G','Ab','A','Bb','B'];
    this._keyCurrentAcc;
    this._renderer;
    this._context;
    this._canvasWidth;
    this._canvasHeight;
    this._staveWidth;
    this._staveX;
    this._staveY;
    this._div;
    this._stave;
  }

  VexFlowInit(divId, width, height)
  {
    this._canvasWidth = width;
    this._canvasHeight = height;
    this._div = document.getElementById(divId)
    this._renderer = new this._VF.Renderer(this._div, this._VF.Renderer.Backends.SVG);
    this._renderer.resize(width, height);
    this._context = this._renderer.getContext();
  }

  drawStave(x, y, width)
  {
    this._staveWidth = width;
    this._staveX = x;
    this._staveY = y;
    this._stave = new this._VF.Stave(x, y, width);
    this._stave.setContext(this._context);
    this._stave.addClef("treble");
    this._stave.setKeySignature(this._keyName);
    this._stave.draw();
  }

  newKeySig(eid, keyOffset, keyName)
  {
    this._keyName = keyName;
    this._keyOffset = (+keyOffset);

    // Using flats or sharps/none?
    let mods = this._stave.modifiers;
    let ks = mods.find(i => i.constructor.name === 'KeySignature');
    let acc = ks.accList[0] ? ks.accList[0].type : false;
    let scaleAcc = acc === 'b' ? this._keyFlatAcc : this._keySharpAcc;
    this._keyCurrentAcc = scaleAcc;

    // Scale quaility - Major or minor?
    let scaleType = this._keyName.indexOf('m') > -1 ? 'minor' : 'major';

    // Build the scale note names
    switch (scaleType)
    {
      case 'major':
        this._keyCurrentScale = this._keyMajorScale;
        break;

      case 'minor':
        this._keyCurrentScale = this._keyMinorScale;
        break;

      default:
        console.error('scale type not found: ' + scaleType)
    }
    this._cleanCanvas();
  }

  getChord(eid, chordDegree, chordName)
  {
    let endpoint = server + 'data/ChordStructure/' + chordName;
    fetch(endpoint)
      .then(response => {return response.json()})
      .then(items => this._putChord(eid, chordDegree, items))
      .catch(error => console.error(error));
  }

  _putChord(eid, chordDegree, items)
  {
    console.log(items);
    // Move semitone pattern to the chord root
    let rootShift = this._keyCurrentScale[chordDegree - 1];
    for (let i in items)
    {
      // Calculate the index into the list of notes with accidentals
      items[i] =
        items[i].semitones
        + this._keyOffset
        + rootShift;

      // Build the note text string for VexFlow
      items[i] =
        this._keyCurrentAcc[items[i] % 12]
        + '/'
        + Math.floor((items[i] / 12) + this._scaleOctave);
    }

    var notes = [
        new this._VF.StaveNote({clef: "treble", keys: items, duration: "h" })
      ];

    this._cleanCanvas();
    this._VF.Formatter.FormatAndDraw(this._context, this._stave, notes, true);
    this._stave.draw();
  }

  // Can't remove items from SVG canvas (?)
  // Just create a new clean one after changing the drawing elements
  _cleanCanvas()
  {
    this._div.removeChild(this._div.lastChild);
    this._renderer = new this._VF.Renderer(this._div, this._VF.Renderer.Backends.SVG);
    this._renderer.resize(this._canvasWidth, this._canvasHeight);
    this._context = this._renderer.getContext();
    this.drawStave(this._staveX, this._staveY, this._staveWidth);
  }
}
