CREATE TABLE shows (
  id serial primary key,
  title varchar(100),
  year varchar(4),
  composer,
  img_url varchar(255)
);

CREATE TABLE songs (
  id serial primary key,
  embed_url varchar(255),
  show_id integer references shows(id)
);