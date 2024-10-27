CREATE DATABASE Друзья_человека;
USE Друзья_человека;

CREATE TABLE Animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birth_date DATE,
    type ENUM('домашнее', 'вьючное'),
    commands TEXT
);

CREATE TABLE Horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES Animals(id)
);

CREATE TABLE Donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES Animals(id)
);

CREATE TABLE Camels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES Animals(id)
);

INSERT INTO Animals (name, birth_date, type, commands) VALUES
('Барсик', '2020-06-15', 'домашнее', 'Сидеть, Лежать'),
('Мул', '2018-04-10', 'вьючное', 'Грузить'),
('Лошадь', '2019-02-20', 'вьючное', 'Бежать, Прыгать'),
('Осел', '2021-05-05', 'вьючное', 'Тянуть');

DELETE FROM Camels;

CREATE TABLE CombinedAnimals AS 
SELECT * FROM Horses UNION SELECT * FROM Donkeys;

CREATE TABLE YoungAnimals AS 
SELECT id, name, birth_date, DATEDIFF(CURDATE(), birth_date) / 30 AS age_in_months 
FROM Animals 
WHERE DATEDIFF(CURDATE(), birth_date) BETWEEN 365 AND 730;

CREATE TABLE AllAnimals AS 
SELECT a.id, a.name, a.birth_date, a.type, a.commands, 
       CASE WHEN h.animal_id IS NOT NULL THEN 'лошадь' 
            WHEN d.animal_id IS NOT NULL THEN 'осел' 
            ELSE NULL END AS previous_table 
FROM Animals a
LEFT JOIN Horses h ON a.id = h.animal_id
LEFT JOIN Donkeys d ON a.id = d.animal_id;