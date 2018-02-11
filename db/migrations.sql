DROP DATABASE snitchr;
CREATE DATABASE snitchr;

\c snitchr

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(60),
  lastname VARCHAR(60),
  email VARCHAR(60),
  password_digest VARCHAR(60)
);

CREATE TABLE incidents (
	id SERIAL PRIMARY KEY,
	user_id SERIAL,
	type_of_incident VARCHAR(60),
	location_description VARCHAR(60),
	address VARCHAR(60),
	on_going BOOL NOT NULL
);

INSERT INTO users (firstname, lastname, email, password_digest)
VALUES ('value1','value2','value3','value4');

INSERT INTO incidents (user_id, type_of_incident, location_description, address, on_going)
VALUES ('1', 'crime', 'at the TJ Max at Madison and State', '11 N. State St., Chicago, IL', true);