CREATE TABLE shows (
  id serial primary key,
  title varchar(100) NOT NULL,
  year varchar(4) NOT NULL,
  composer varchar(100) NOT NULL,
  img_url varchar(255) NOT NULL
);

CREATE TABLE songs (
  id serial primary key,
  embed_id varchar(50) NOT NULL,
  show_id integer references shows(id)
);