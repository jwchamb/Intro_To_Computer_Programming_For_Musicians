
INSERT INTO chord_structure
  (type_id, interval_id)
  VALUES
  ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Major Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Major Triad')
    , (SELECT id FROM interval WHERE name = 'Perfect Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Minor Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Minor Triad')
    , (SELECT id FROM interval WHERE name = 'Perfect Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Minor Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Diminished Triad')
    , (SELECT id FROM interval WHERE name = 'Diminished Fifth'))

  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Unison'))
  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Major Third'))
  , ((SELECT id FROM chord_type WHERE name = 'Augmented Triad')
    , (SELECT id FROM interval WHERE name = 'Augmented Fifth'));

INSERT INTO chord_roman
  (symbol, root, chord_type_id)
  VALUES
  ('I', 1, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('II', 2, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('III', 3, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('IV', 4, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('V', 5, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('VI', 6, (SELECT id FROM chord_type WHERE name = 'Major Triad'))
  , ('VII', 7, (SELECT id FROM chord_type WHERE name = 'Major Triad'))

  , ('i', 1, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('ii', 2, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('iii', 3, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('iv', 4, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('v', 5, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('vi', 6, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))
  , ('vii', 7, (SELECT id FROM chord_type WHERE name = 'Minor Triad'))

  , ('i˚', 1, (SELECT id FROM chord_type WHERE name = 'Diminished Triad'))
  , ('ii˚', 2, (SELECT id FROM chord_type WHERE name = 'Diminished Triad'))
  , ('iii˚', 3, (SELECT id FROM chord_type WHERE name = 'Diminished Triad'))
  , ('iv˚', 4, (SELECT id FROM chord_type WHERE name = 'Diminished Triad'))
  , ('I+', 1, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('II+', 2, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('III+', 3, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('IV+', 4, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('V+', 5, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('VI+', 6, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'))
  , ('VII+', 7, (SELECT id FROM chord_type WHERE name = 'Augmented Triad'));
