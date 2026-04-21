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

DROP TABLE hero;

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



--  updating the admin table 
ALTER TABLE admin
ADD COLUMN full_name TEXT,
ADD COLUMN age INT,
ADD COLUMN salary NUMERIC(10,2),
ADD COLUMN is_active BOOLEAN DEFAULT TRUE,
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP,
ADD COLUMN birth_date DATE,
ADD COLUMN login_time TIME,
ADD COLUMN last_login TIMESTAMPTZ,
ADD COLUMN email VARCHAR(100) UNIQUE,
ADD COLUMN phone CHAR(10),
ADD COLUMN profile_json JSON,
ADD COLUMN preferences JSONB,
ADD COLUMN ip_address INET,
ADD COLUMN uuid_id UUID DEFAULT gen_random_uuid(),
ADD COLUMN rating REAL,
ADD COLUMN score DOUBLE PRECISION,
ADD COLUMN data BYTEA,
ADD COLUMN status SMALLINT,
ADD COLUMN tags TEXT[];


--removing few column of the table 
ALTER TABLE admin
DROP COLUMN profile_json,
DROP COLUMN preferences,
DROP COLUMN ip_address;


--add value to the student table 
INSERT INTO students (name, age)
VALUES ('Ram', 20);


--Inserting multiple  data into student table
INSERT INTO students (name, age)
VALUES
('shyam', 30),
('Sita', 22),
('Hari', 19);


--how to View the data
SELECT * FROM teacher;

--creating data for teacher
INSERT INTO teacher (name, age)
VALUES
('ROHAN',35),
('SHOHAN',54);

--update the single value of one data 
UPDATE teacher
SET age = 65
WHERE name = 'ROHAN';


--updating value of multiple data
UPDATE teacher
SET age = CASE
    WHEN name = 'ROHAN' THEN 65
    WHEN name = 'SHOHAN' THEN 60
END;

--let update name
--updating value of multiple data
UPDATE teacher
SET NAME= CASE
    WHEN age = 65 THEN 'lali'
    WHEN age = 60 THEN 'jali'
END;


SELECT * FROM admin;

--Make sure admin have row
INSERT INTO admin (name, role)
VALUES
('Main Admin', 'Super Admin');


-- for student
ALTER TABLE students
ADD COLUMN admin_id INT;

--for teacher
ALTER TABLE teacher
ADD COLUMN admin_id INT;

SELECT * FROM teacher;
SELECT * FROM students;

UPDATE students
SET admin_id = 2
WHERE admin_id IS NULL;

UPDATE teacher
SET admin_id = 1
WHERE admin_id IS NULL;


ALTER TABLE students
ADD CONSTRAINT fk_students_admin
FOREIGN KEY (admin_id) REFERENCES admin(id);

ALTER TABLE teacher
ADD CONSTRAINT fk_teacher_admin
FOREIGN KEY (admin_id) REFERENCES admin(id);


