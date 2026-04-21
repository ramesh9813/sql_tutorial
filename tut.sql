CREATE DATABASE student_management_system;
DROP DATABASE student_management_system;

\c postgres;


CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
CREATE TABLE HERO (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);


CREATE TABLE ADMIN(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    ROLE VARCHAR(50)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    address TEXT,
    phone VARCHAR(15),
    created_at TIMESTAMP
);