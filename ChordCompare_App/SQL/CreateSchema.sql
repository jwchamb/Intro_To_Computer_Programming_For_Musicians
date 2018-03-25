
\set myschema 'final_project'

DROP SCHEMA IF EXISTS :myschema CASCADE;

SET search_path TO :myschema, "$user", public;

CREATE SCHEMA :myschema

  CREATE TABLE interval (
    id SERIAL PRIMARY KEY
    , name VARCHAR(30)
    , semitones INTEGER
  )

  CREATE TABLE chord_type (
    id SERIAL PRIMARY KEY
    , name VARCHAR(30)
  )

  CREATE TABLE chord_structure (
    id SERIAL PRIMARY KEY
    , type_id INTEGER NOT NULL REFERENCES chord_type(id)
    , interval_id INTEGER NOT NULL REFERENCES interval(id)
  )

  CREATE TABLE chord_roman (
    id SERIAL PRIMARY KEY
    , symbol VARCHAR(10)
    , degree INTEGER
    , chord_type_id INTEGER NOT NULL REFERENCES chord_type(id)
  )

  CREATE TABLE scale_name (
    id SERIAL PRIMARY KEY
    , name VARCHAR(30)
  )

  CREATE TABLE scale (
    id SERIAL PRIMARY KEY
    , scale_name_id INTEGER NOT NULL REFERENCES scale_name(id)
    , degree INTEGER
    , interval_id INTEGER NOT NULL REFERENCES interval(id)
  )

  CREATE TABLE key (
    id SERIAL PRIMARY key
    , symbol VARCHAR(4)
    , root_offset INT
  );

\i InsertChordTypes.sql
\i GetListRomanNames.sql
\i GetListKeySignatures.sql
\i GetChordStructure.sql
\i InsertChordRoman.sql
\i InsertIntervals.sql
\i InsertKeys.sql
\i InsertScaleNames.sql
\i InsertScales.sql
\i InsertTriadChords.sql
