DROP TABLE booking_infos;
DROP TABLE members;
DROP TABLE exercise_classes;

CREATE TABLE members(
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL
);

CREATE TABLE exercise_classes(
id SERIAL8 PRIMARY KEY,
class_name VARCHAR(255) NOT NULL,
when_class VARCHAR(255) NOT NULL
);

CREATE TABLE booking_infos(
id SERIAL8 PRIMARY KEY,
exercise_class_id INT8 REFERENCES exercise_classes(id),
memeber_id INT8 REFERENCES members(id)
);
