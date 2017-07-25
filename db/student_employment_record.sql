DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS companies;


CREATE TABLE types (
  id SERIAL8 PRIMARY Key,
  type VARCHAR(255)
);

CREATE TABLE companies (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
location VARCHAR(255),
logo VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  gender VARCHAR(255),
  cohort VARCHAR(255),
  graduation_date DATE,
  picture VARCHAR(255)
);

CREATE TABLE jobs (
  id SERIAL8 PRIMARY KEY,
  company_id INT REFERENCES companies(id),
  student_id INT REFERENCES students(id),
  type_id INT  REFERENCES types(id)
);