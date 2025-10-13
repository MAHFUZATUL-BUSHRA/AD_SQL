-- DDL (Data Defination Language)

DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES (
	ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT
);

ALTER TABLE EMPLOYEES ADD COLUMN EMAIL VARCHAR(50);
RENAME TABLE EMPLOYEES TO STAFF;

SELECT * FROM EMPLOYEES;
DROP TABLE STAFF;

INSERT INTO EMPLOYEES (ID, NAME, DEPARTMENT,SALARY)
VALUES 
(1, 'SAJIB','DATA',50000),
(2, 'MAISHA','DATA',50000);

UPDATE EMPLOYEES SET SALARY = 60000 WHERE NAME = 'SAJIB';

CREATE TABLE EMPLOYEES (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT, 
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO EMPLOYEES (NAME, DEPARTMENT,SALARY)
VALUES 
('WALID','DATA',98000),
('ANAN','HR',85000);

UPDATE EMPLOYEES SET SALARY = 118000 WHERE NAME = 'WALID';
UPDATE EMPLOYEES SET DEPARTMENT = 'PRODUCT' WHERE NAME = 'ANAN';

SELECT * FROM EMPLOYEES;


-- MAINTAINIG ALL TYPES OF DATA INTEGRITY
CREATE TABLE EMPLOYEES (
	ID INT AUTO_INCREMENT PRIMARY KEY, 
    NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE, 
    PHONE VARCHAR(20),
	SALARY DECIMAL(10,2) CHECK (SALARY >= 0),
    IS_ACTIVE BOOLEAN DEFAULT TRUE,
    JOIN_DATE DATE, 
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--     INDEX IDX_SALARY (SALARY),-- 
    -- INDEX IDX_ACTIVE_JOIN (IS_ACTIVE, JOIN_DATE)
);

SELECT * FROM EMPLOYEES;

SHOW INDEX FROM EMPLOYEES;

explain SELECT * FROM EMPLOYEES 
where salary = 70000;

CREATE INDEX IDX_SALARY ON EMPLOYEES(SALARY);




INSERT INTO EMPLOYEES (NAME, EMAIL, PHONE, SALARY, IS_ACTIVE, JOIN_DATE) VALUES
('Alice Johnson', 'alice.johnson@example.com', '01711111111', 55000.00, TRUE, '2021-01-10'),
('Bob Smith', 'bob.smith@example.com', '01711111112', 48000.00, TRUE, '2022-03-15'),
('Charlie Davis', 'charlie.davis@example.com', '01711111113', 61000.00, FALSE, '2020-07-01'),
('Diana Evans', 'diana.evans@example.com', '01711111114', 72000.00, TRUE, '2023-05-25'),
('Ethan Wright', 'ethan.wright@example.com', '01711111115', 50000.00, TRUE, '2021-09-12'),
('Fiona Green', 'fiona.green@example.com', '01711111116', 47000.00, FALSE, '2022-12-02'),
('George Hall', 'george.hall@example.com', '01711111117', 53000.00, TRUE, '2021-06-18'),
('Hannah Scott', 'hannah.scott@example.com', '01711111118', 49000.00, TRUE, '2020-11-09'),
('Ian Baker', 'ian.baker@example.com', '01711111119', 58000.00, TRUE, '2023-02-17'),
('Jasmine Lee', 'jasmine.lee@example.com', '01711111120', 62000.00, TRUE, '2022-08-30'),

('Kevin Young', 'kevin.young@example.com', '01711111121', 54000.00, TRUE, '2020-01-01'),
('Laura King', 'laura.king@example.com', '01711111122', 50000.00, FALSE, '2023-03-10'),
('Michael Adams', 'michael.adams@example.com', '01711111123', 70000.00, TRUE, '2022-06-06'),
('Natalie Brooks', 'natalie.brooks@example.com', '01711111124', 68000.00, TRUE, '2021-04-22'),
('Oscar Reed', 'oscar.reed@example.com', '01711111125', 45000.00, FALSE, '2020-10-13'),
('Paula Turner', 'paula.turner@example.com', '01711111126', 73000.00, TRUE, '2022-02-28'),
('Quentin Rivera', 'quentin.rivera@example.com', '01711111127', 56000.00, TRUE, '2023-01-01'),
('Rachel Cox', 'rachel.cox@example.com', '01711111128', 47000.00, TRUE, '2021-07-14'),
('Steve Morgan', 'steve.morgan@example.com', '01711111129', 52000.00, FALSE, '2020-05-05'),
('Tina Ward', 'tina.ward@example.com', '01711111130', 60000.00, TRUE, '2023-04-09'),

('Umar Bennett', 'umar.bennett@example.com', '01711111131', 61000.00, TRUE, '2021-12-12'),
('Vera Diaz', 'vera.diaz@example.com', '01711111132', 49000.00, TRUE, '2022-09-01'),
('William Hayes', 'william.hayes@example.com', '01711111133', 55000.00, FALSE, '2020-02-15'),
('Xenia James', 'xenia.james@example.com', '01711111134', 53000.00, TRUE, '2023-07-20'),
('Yusuf Cole', 'yusuf.cole@example.com', '01711111135', 58000.00, TRUE, '2022-11-11'),
('Zara Hughes', 'zara.hughes@example.com', '01711111136', 62000.00, TRUE, '2021-03-03'),
('Aaron Lane', 'aaron.lane@example.com', '01711111137', 46000.00, TRUE, '2020-06-06'),
('Bella Knight', 'bella.knight@example.com', '01711111138', 49000.00, TRUE, '2021-10-10'),
('Caleb Olson', 'caleb.olson@example.com', '01711111139', 61000.00, FALSE, '2022-01-19'),
('Daisy Warren', 'daisy.warren@example.com', '01711111140', 54000.00, TRUE, '2023-08-22'),

('Eli Chapman', 'eli.chapman@example.com', '01711111141', 63000.00, TRUE, '2022-04-17'),
('Faith Simmons', 'faith.simmons@example.com', '01711111142', 47000.00, TRUE, '2020-03-23'),
('Gavin Walters', 'gavin.walters@example.com', '01711111143', 52000.00, FALSE, '2021-11-01'),
('Hazel Fletcher', 'hazel.fletcher@example.com', '01711111144', 57000.00, TRUE, '2023-02-05'),
('Isaac Fleming', 'isaac.fleming@example.com', '01711111145', 59000.00, TRUE, '2020-12-12'),
('Jade Bishop', 'jade.bishop@example.com', '01711111146', 50000.00, TRUE, '2021-08-19'),
('Kyle Harmon', 'kyle.harmon@example.com', '01711111147', 62000.00, FALSE, '2022-05-05'),
('Luna Francis', 'luna.francis@example.com', '01711111148', 46000.00, TRUE, '2023-06-30'),
('Mason Doyle', 'mason.doyle@example.com', '01711111149', 58000.00, TRUE, '2021-02-01'),
('Nina Hopkins', 'nina.hopkins@example.com', '01711111150', 60000.00, TRUE, '2022-10-10');
