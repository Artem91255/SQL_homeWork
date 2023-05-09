CREATE DATABASE hometask_5;
USE hometask_5;
CREATE TABLE Cars
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost  INT NULL
);

INSERT INTO Cars (name, cost) VALUES ('Audi', 52642);
INSERT INTO Cars (name, cost) VALUES ('Mercedes', 57127);
INSERT INTO Cars (name, cost) VALUES ('Skoda', 9000);
INSERT INTO Cars (name, cost) VALUES ('Volvo', 29000);
INSERT INTO Cars (name, cost) VALUES ('Bentley', 350000);
INSERT INTO Cars (name, cost) VALUES ('Citroen', 21000);
INSERT INTO Cars (name, cost) VALUES ('Hummer', 41400);
INSERT INTO Cars (name, cost) VALUES ('Volkswagen', 21600);	


SELECT * FROM Cars;


-- _____________________________________
/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

*/

CREATE VIEW cars1 AS 
SELECT * FROM Cars
WHERE cost < 25000;

SELECT * FROM cars1;

/*
2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
*/

ALTER VIEW cars1 AS
SELECT * FROM Cars
WHERE cost < 30000;


SELECT * FROM cars1;



/*
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

*/
CREATE VIEW cars3 AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM cars3;


/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

*/

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';



CREATE TABLE Trains
(
    train    INT, 
    station character varying(20),
    station_time time
		
);

INSERT INTO Trains (train, station, station_time) VALUES (110, "San Francisco", "10:00:00");
INSERT INTO Trains (train, station, station_time) VALUES (110, "Redwood City", "10:54:00");
INSERT INTO Trains (train, station, station_time) VALUES (110, "Palo Alto", "11:02:00");
INSERT INTO Trains (train, station, station_time) VALUES (110, "San Jose", "12:35:00");
INSERT INTO Trains (train, station, station_time) VALUES (120, "San Francisco", "11:00:00");
INSERT INTO Trains (train, station, station_time) VALUES (120, "Palo Alto", "12:49:00");
INSERT INTO Trains (train, station, station_time) VALUES (120, "San Jose", "13:30:00");

SELECT * FROM Trains;

/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

*/


SELECT train, station, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train ORDER BY train), station_time)
AS time_to_next_station
FROM Trains;













