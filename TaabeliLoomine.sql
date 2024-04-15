CREATE DATABASE kinoteatrDanielVanni;
USE kinoteatrDanielVanni;


---Tabeli loomine zanr .
CREATE TABLE zannr(
	zannrId int Primary Key identity(1,1),
	zannrNimi varchar(25),
	zannrKirjeldus TEXT)

INSERT INTO zannr (zannrNimi, zannrKirjeldus)
VALUES ('drama', 'fantasy'), ('närviline', 'ilus'), ('suur', 'väike'), ('Mitte Loomulik', 'Loomulik'), ('Uus', 'Vana')
SELECT * FROM zannr
DELETE FROM zannr

---Tabeli loomine filmType.
CREATE TABLE filmType(
	filmTypeId int Primary Key identity(1,1),
	filmType varchar(25),
	kirjeldus TEXT)

INSERT INTO filmType (filmType, kirjeldus)
VALUES ('2D', 'Uus Graafika'), ('3D', 'Vana Graafika'), ('8D', 'väga vana graafika'), ('5D', 'väga uus grafika'), ('4D', 'väga animeeritud graafika')
SELECT * FROM filmType
DELETE FROM filmType

---tabeli loomine rezisor.
CREATE TABLE rezisor(
	resizorId int Primary Key identity(1,1),
	eesnimi varchar(25),
	perenimi varchar(25))

INSERT INTO rezisor (eesnimi, perenimi)
VALUES ('Daniel', 'Vanni'), ('Aleksei', 'Paal'), ('Artemi', 'POdporin'), ('Bogdan', 'Jakovlev')
SELECT * FROM rezisor
DELETE FROM rezisor

---Tabeli loomine piletiMyyk.
CREATE TABLE piletimyk(
	piletimykId int Primary Key identity(1,1),
	kogus int,
	kinokavaId int)
SELECT * FROM piletimyk
DELETE FROM piletimyk

---Tabeli loomine kinokava.
CREATE TABLE kinokava(
	kinokavaId int Primary Key identity(1,1),
	kuupaev DATETIME,
	filmNimetus int,
	piletihind int)
SELECT * FROM kinokava
DELETE FROM kinokava




---Tabeli loomine film.
CREATE TABLE film(
	filmId int Primary Key identity(1,1),
	filmNimetus varchar(25),
	zannrId int,
	pikkus int,
	rezisorId int,
	filmTypeId int,
	reklaam image)
SELECT * FROM film

---FK: film-->filmType
ALTER TABLE film ADD FOREIGN KEY (filmTypeId) REFERENCES filmType(filmTypeId);

---FK: film-->rezisorId
ALTER TABLE film ADD FOREIGN KEY (rezisorId) REFERENCES rezisor(resizorId);

---FK: film-->zannrId
ALTER TABLE film ADD FOREIGN KEY (zannrId) REFERENCES zanr(zanrId);


---FK: kinokava-->filmId
ALTER TABLE kinokava ADD FOREIGN KEY (filmNimetus) REFERENCES film(filmId);

---FK: piletiMyyk-->kinokavaId
ALTER TABLE piletiMyyk ADD FOREIGN KEY (kinokavaId) REFERENCES kinokava(kinokavaId);