
--drop the tables first

DROP TABLE IF EXISTS MovieActors;
DROP TABLE IF EXISTS MovieDirectors;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Person;

--CREATE statements

CREATE TABLE People(
Pid char(4) not null,
Name varchar(32),
Address varchar(100),
primary key (Pid)
);

CREATE TABLE Directors(
Pid char(4) not null references People(Pid),
Film School char(64),
Directors Guild Anniversary date,
primary key(Pid)
);

CREATE TABLE Actors(
Pid char(4) not null references People(Pid),
DOB date,
Hair Color varchar(8),
Eye Color varchar(8),
Height Inches integer,
Weight integer,
Screen Actors Guild Anniversary date,
primary key(Pid)
);

CREATE TABLE Movies(
Mid char(4) not null,
Name varchar(64),
YearReleased integer,
Domestic Sales numeric(12,2),
ForeignSales numeric(12,2),
DVD Bluray Sales numeric(12,2),
primary key(Mid)
);

CREATE TABLE MovieDirectors(
Mid char(4) not null references Movies(Mid),
Pid char(4) not null references Directors(Pid),
primary key (Mid, Pid)
);

CREATE TABLE MovieActors(
Mid char(4) not null references Movies(Mid),
Pid char(4) not null references Actors(Pid),
primary key (Mid, Pid)
);

--INSERT statements 
INSERT INTO Person(pid, name, address) VALUES
('p01', 'Michael Bay', 'New York'), --Director, m01
('p02', 'Steven Spielberg', 'California'), --Director, m02, m03
('p03', 'Quentin Tarantino', 'California'), --Actor and Director, m02(acted), m03(directed)
('p04', 'Chell', 'Aperture Science'), --Actor m01, m02
('p05', 'Daniel Radcliffe', 'California'), --Actor m03
('p06', 'Sean Connery', 'Undiscernable'); --Actor m01, m03

INSERT INTO Directors(pid, film_school, directors_guild_anniversary) VALUES
('p01', 'New York Film Academy', '01/26/1977'),
('p02', 'American Film Institute', '08/26/1988'),
('p03', 'Marist College', '04/18/1994');

INSERT INTO Actors(pid, dob, hair_color, eye_color, height_inches, weight, screen_actors_guild_anniversary_date) VALUES
('p03', '04/25/1968', 'Black', 'Brown', 78, 173, '11/27/1994'),
('p04', '05/17/1955', 'Black', 'Green', 72, 164, '10/28/1982'),
('p05', '11/10/1977', 'Red', 'Green', 67, 143, '02/18/1972'),
('p06', '06/28/1981', 'White', 'Brown', 71, 159, '08/13/1997');

INSERT INTO Movies(mid, name, year_released, domestic_sales, foreign_sales, dvd_bluray_sales) VALUES
('m01', 'Enders Game', 2013, 17000000.00, 50547321.00, 8400000.00),
('m02', 'Skyfall', 2012, 77000000.00, 78000000.00, 7300000.00),
('m03', 'Harry Potter and the Prisoner of Azkaban', 2004, 24953895.00, 54714959.00, 82000000.00);

INSERT INTO MovieDirectors(mid, pid) VALUES
('m01', 'p01'),
('m02', 'p02'),
('m03', 'p02'),
('m03', 'p03');

INSERT INTO MovieActors(mid, pid) VALUES
('m01', 'p04'),
('m02', 'p04'),
('m03', 'p05'),
('m01', 'p06'),
('m03', 'p06');

--Query that returns the name of all directors with whom "Sean Connery" has worked
SELECT name FROM People
WHERE Pid IN (
				SELECT Pid FROM MovieDirectors
					WHERE Mid IN (
						SELECT Mid FROM MovieActors
							WHERE Pid IN (
								SELECT Pid FROM Person
									WHERE Name = 'Sean Connery'
										  )
								  )
              );