
Chord Compare is a client-server app for working with chord progressions

The entry point for the app by default is localhost://ChordCompare.html

App Status:

Very alpha. The major components work together, but rendering is inaccurate. The control surface is minimal.

Currently only triads are supported.

Notes to do not display on the proper staff lines.


Background:

Harmonizing a melody is a common task that requires sequencing chords. There are vertical and horizontal components to the selection - how does a note in the melody fit into a chord, and how does a chord fit with the preceding and following chords.

There are a few fairly simple rules for evaluating the suitability of a chord for a given combination of vertical and horizontal settings. From there it is up to the composer to select a chord, possibly modifying it by inverting it.

For working with notes, the program uses a database of chords and scales, mapping chords to different scale types and key signatures. The browser presentation uses notation/calligraphy graphic objects from the VexFlow package. Control is done manage with simple html input objects.

nodejs/express is used as the middleware and web server. Postgres is used for persistent storage.

TODO:
* Update the back end to provide scale degrees as well as semitone intervals for chord notes.
* Sort out how VexFlow manages objects on the stave - spacing, how accidentals interact with the key signature.
* Add color keys to show notes that match between chords.
* Provide a sequence of chords, from left to right, with at least two staves and/or a grand staff. The top row will be the melody note selections, the bottom row will be the chord choice selections.

http://www.vexflow.com
