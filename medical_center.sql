DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birth_date DATE NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birth_date DATE NOT NULL,
  primary_doctor INTEGER REFERENCES doctors
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  date DATE
);

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE visit_diagnoses
(
  id SERIAL PRIMARY KEY,
  diagnosis_id INTEGER REFERENCES diagnoses ON DELETE CASCADE,
  visit_id INTEGER REFERENCES visits ON DELETE CASCADE
);

INSERT INTO diagnoses (name)
VALUES ('heart disease'), ('asthma'), ('high blood pressure');

INSERT INTO doctors
  (first_name, last_name, birth_date)
VALUES
  ('Asher', 'Adams', '1970-01-02'),
  ('Bethany', 'Beck', '1965-02-03');

INSERT INTO patients
  (first_name, last_name, birth_date, primary_doctor)
VALUES
  ('Claire', 'Cheng', '1995-03-04', 1),
  ('Dmitri', 'Denver', '2014-04-05', 2),
  ('Eugenia', 'Evers', '1958-05-06', 1);

INSERT INTO visits
  (doctor_id, patient_id, date)
VALUES
  (1, 1, '2019-02-04'),
  (1, 2, '2019-02-04'),
  (1, 3, '2019-03-05'),
  (2, 2, '2020-03-06'),
  (2, 2, '2020-05-08');

INSERT INTO visit_diagnoses
  (diagnosis_id, visit_id)
VALUES
  (1, 3),
  (3, 3),
  (2, 4);
