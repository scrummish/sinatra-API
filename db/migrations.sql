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

CREATE TABLE reports (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	type_of_incident VARCHAR(60),
	incident_details VARCHAR(120),
	location_description VARCHAR(120),
	address VARCHAR(60),
	latitude FLOAT NOT NULL ,
	longitude FLOAT NOT NULL 
);

INSERT INTO users (firstname, lastname, email, password_digest)
VALUES ('value1','value2','value3','value4');

INSERT INTO incidents (user_id, type_of_incident, location_description, address, on_going)
VALUES ('1', 'crime', 'at the TJ Max at Madison and State', '11 N. State St., Chicago, IL', true);