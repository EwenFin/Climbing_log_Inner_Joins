DROP TABLE outings;
DROP TABLE climbers;
DROP TABLE routes;

CREATE TABLE climbers(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
skill_level INT2
);

CREATE TABLE routes(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
difficulty INT2
);

CREATE TABLE outings(
id SERIAL4 PRIMARY KEY,
climber_id INT4 REFERENCES climbers(id) ON DELETE CASCADE,
route_id INT4 REFERENCES routes(id) ON DELETE CASCADE,
review VARCHAR(255)
);