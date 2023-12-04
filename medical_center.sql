DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL
);

CREATE TABLE doctor_patient
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    diagnosis TEXT
);

-------Creating data--------
INSERT INTO doctors (first_name, last_name)
VALUES
('Greg','Schmidt'),
('Vanessa', 'Stoney'),
('Carl', 'Withers');

INSERT INTO patients (first_name,last_name)
VALUES
('Jake', 'Muttley'),
('Rob', 'Bert'),
('Hannah','Bjornson');

INSERT INTO doctor_patient (doctor_id, patient_id, diagnosis)
VALUES
(1,1, 'stomache ache'),(1,2, 'fever'),(1,3, 'broken leg'),
(2,2, 'broken hand'),(2,3, 'dermatitis'),
(3,3, 'ear infection');