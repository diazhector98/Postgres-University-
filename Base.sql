Create type loc as (
	street	varchar(20),
	zip	varchar(20))

create table person (
	pId varchar(10) primary key,
	firstName varchar(20),
	lastName varchar(20),
	dob date);

Create table student (
	Primary key (pId),
	status varchar(20),
	memberOf text[],
) inherits (person);

Create table faculty (
	Primary key (pId),
	rank	varchar(20),
	advisorOf	text[],
)inherits (person);

Create table campusClub (
	cId	varchar(10) primary key,
	name	varchar(20),
	location	loc,
	phone	varchar(20),
	members text[],
);

Create table department (
code varchar(20) primary key,
name varchar(20),
students text[],
deptFaculty text[],
);


/*

Agregando la constraint Unique para los ids de las tablas
*/
ALTER TABLE department
ADD CONSTRAINT name_unique UNIQUE (name)

/*
Agregando las reference keys a student
*/

ALTER TABLE student
ADD COLUMN major varchar(10);

ALTER TABLE department
ADD CONSTRAINT name_unique UNIQUE (name)

ALTER TABLE student
ADD CONSTRAINT major_in_department FOREIGN KEY (major) REFERENCES department (name);


/*
Agregando las reference keys a faculty
*/


ALTER TABLE faculty
ADD COLUMN dept varchar(20)

ALTER TABLE faculty
ADD COLUMN chairOf varchar(20)

ALTER TABLE faculty
ADD CONSTRAINT faculty_department FOREIGN KEY(dept) REFERENCES department(code)

ALTER TABLE faculty
ADD CONSTRAINT faculty_chairOf FOREIGN KEY(chairOf) REFERENCES department(code)

/*
Agregando las reference keys a campus club
*/

ALTER TABLE campusClub
ADD COLUMN advisor varchar(10)


ALTER TABLE campusClub
ADD CONSTRAINT cc_advisor FOREIGN KEY(advisor) references faculty(pId)

/*
Agregando las reference keys a department
*/

ALTER TABLE department
ADD COLUMN deptChair varchar(10)

ALTER TABLE department
ADD CONSTRAINT department_chair FOREIGN KEY(deptChair) REFERENCES faculty(pId)





/*

Insertando profesores

*/

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('1', 'Juan Carlos', 'Lavariega', '4-OCT-2000', 'Titular', NULL, NULL, NULL)

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('2', 'Pablo', 'Diaz', '5-OCT-2000', 'Asociado', NULL, NULL, NULL);

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('3', 'Leonardo', 'Garrido', '6-OCT-2000', 'Asistente', NULL, NULL, NULL);

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('4', 'Luis Humberto', 'Gonzalez', '8-OCT-2000', 'Asociado', NULL, NULL, NULL);

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('5', 'Elda', 'Quiroga', '9-OCT-2000', 'Instructor', NULL, NULL, NULL);

INSERT INTO faculty
("pid", "firstname", "lastname", "dob", "rank", "advisorof", "dept", "chairof")
VALUES ('6', 'Mario', 'De la Fuente', '10-OCT-2000', 'Titular', NULL, NULL, NULL);

/*

Insertando campus clubs

*/


INSERT INTO campusclub
("cid", "name", "location", "phone", "members", "advisor")
values
('100', 'Club1', ROW('Garza Sada','101'), '88808707',ARRAY[]::text[],NULL);


INSERT INTO campusclub
values
('101', 'Club2', ROW('Junco de la Vega','301'), '88801000',ARRAY[]::text[],NULL);

INSERT INTO campusclub
values
('102', 'Club3', ROW('Garcia Roel','202'), '83675859',ARRAY[]::text[],NULL);


/*

Hacer el

*/
