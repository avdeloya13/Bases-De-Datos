CREATE TABLE PERIODO
(
  ID_Periodo INT NOT NULL DEFAULT '20232',
  CONSTRAINT pkPerido 
  PRIMARY KEY (ID_Periodo)
);

CREATE TABLE ALUMNO
(
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  NumCuenta INT NOT NULL,
  Turno VARCHAR(10) NOT NULL CHECK(Turno = 'Matutino' OR Turno = 'Vespertino'),
  Generacion INT NOT NULL CHECK (Generacion>2013),
  NumMaterias INT NOT NULL CHECK (NumMaterias < 7),
  SemestreAlumno CHAR(6) NOT NULL,
  ID_Periodo INT NOT NULL DEFAULT '20232' CHECK (Generacion < ID_Periodo),
  CONSTRAINT pkAlumno 
  PRIMARY KEY (NumCuenta)
);

CREATE TABLE ROL
(
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  ID INT NOT NULL,
  NumGrupos INT NOT NULL CHECK (NumGrupos < 4),
  Rol BOOL NOT NULL,
  ID_Ayuda INT NOT NULL,
  CONSTRAINT pkRol 
  PRIMARY KEY (ID)
);

CREATE TABLE GRUPO
(
  ID_Grupo VARCHAR(5) NOT NULL,
  Cupo INT NOT NULL,
  ID_Periodo INT NOT NULL DEFAULT '20232',
  ID INT NOT NULL,
  CONSTRAINT pkGrupo 
  PRIMARY KEY (ID_Grupo)
);

CREATE TABLE ASIGNATURA
(
  Nombre VARCHAR(50) NOT NULL,
  Creditos INT NOT NULL CHECK (Creditos> 3 AND Creditos < 13),
  Semestre CHAR(6) NOT NULL,
  ID_Grupo VARCHAR(5) NOT NULL,
  CONSTRAINT pkAsignatura 
  PRIMARY KEY (Nombre)
);

CREATE TABLE Cursa
(
  Num_VecesCursada INT NOT NULL,
  Ordinario BOOL NOT NULL,
  NumCuenta INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Calificacion INT NOT NULL,
  CONSTRAINT pkCursa 
  PRIMARY KEY (NumCuenta, Nombre) 
);

CREATE TABLE ASIGNATURA_Dias
(
  Dias VARCHAR(15) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT pkAsigDias 
  PRIMARY KEY (Dias, Nombre)
);

CREATE TABLE ASIGNATURA_Horas
(
  Horas  VARCHAR(50) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT pkAsigHoras 
  PRIMARY KEY (Horas, Nombre)
);

--Llaves Foráneas
ALTER TABLE Alumno add constraint fkAlumno FOREIGN KEY (ID_Periodo) REFERENCES PERIODO(ID_Periodo) ON UPDATE CASCADE ON DELETE SET DEFAULT;
ALTER TABLE Asignatura add constraint fkAsignatura FOREIGN KEY (ID_Grupo) REFERENCES GRUPO(ID_Grupo) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Cursa add constraint fkCursa1 FOREIGN KEY (NumCuenta) REFERENCES ALUMNO(NumCuenta) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Cursa add constraint fkCursa2 FOREIGN KEY (Nombre) REFERENCES ASIGNATURA(Nombre) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ASIGNATURA_Dias add constraint fkAsigDias FOREIGN KEY (Nombre) REFERENCES ASIGNATURA(Nombre) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ASIGNATURA_Horas add constraint fkAsigHoras FOREIGN KEY (Nombre) REFERENCES ASIGNATURA(Nombre) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Grupo add constraint fkGrupo1 FOREIGN KEY (ID_Periodo) REFERENCES PERIODO(ID_Periodo) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Grupo add constraint fkGrupo2 FOREIGN KEY (ID) REFERENCES ROL(ID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Rol add constraint fkRol FOREIGN KEY (ID_Ayuda) REFERENCES ROL(ID) ON UPDATE CASCADE ON DELETE CASCADE;

--Los Insert

-- Profesor (20 registros)

INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Ernesto','Marquez',1,2, true,21);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Aurora','Rodriguez',2,2,true,22);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Beatrix', 'Manthroppe', 3, 2,true,23);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Elfrida', 'Miall', 4, 2, true,24);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Anette', 'Finlan', 5, 2, true,25);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Carmelita', 'Perez', 6, 2, true,26);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Evin', 'Cromett', 7, 2, true,27);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Brittni', 'Verden', 8, 2, true,28);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Gracia', 'Fitton', 9, 2, true,29);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Irwin', 'Orme', 10, 2, true,30);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Clarance', 'Danshin', 11, 2, true,31);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Andriette', 'Turtle', 12, 2, true,32);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Adan', 'Melin', 13, 2, true,33);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Felicia', 'Buckleigh', 14, 2, true,34);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Freddy', 'Nesby', 15, 2, true,35);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Lucilia', 'Rossbrook', 16, 2, true,36);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Bianca', 'Swift', 17, 2, true,37);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Monica', 'Carwithen', 18, 2, true,38);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Stuart', 'Alwyn', 19, 2, true,39);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Juan', 'Alvarez', 20, 2, true,40);

-- Ayudante (20 registros)

INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Cristian', 'Mendez',21,2,false,1);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Axel', 'Blower',22,2,false,2);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Ingrid', 'Arnowitz', 23, 2,false,3);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Martha', 'Catling', 24, 2, false,4);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Madelaine', 'Oldnall', 25, 2, false,5);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Paulette', 'Hambers', 26, 2, false,6);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Jose', 'Lucio', 27, 2, false,7);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Gael', 'McMenamie', 28, 2, false,8);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Lucine', 'Dast', 29, 2, false,9);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Emily', 'Gilbert', 30, 2, false,10);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Selene', 'Cabello', 31, 2, false,11);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Lidia', 'Talavera', 32, 2, false,12);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Socorro', 'Rodriguez', 33, 2, false,13);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Raul', 'Pineda', 34, 2, false,14);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Angel', 'Gomez', 35, 2, false,15);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Lucilda', 'Reyes', 36, 2, false,16);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Jessica', 'Andrade', 37, 2, false,17);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Rogelio', 'Leyva', 38, 2, false,18);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Ramona', 'Lavigne', 39, 2, false,19);
INSERT INTO Rol (Nombre, Apellido, ID, NumGrupos, Rol, ID_Ayuda) VALUES ('Eduardo', 'Guzman', 40, 2, false,20);

-- Asignatura (40 registros) 

INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Algebra Superior I',10,1, '1100M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Estructuras Discretas',10,1, '1200M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inglés I',4,1, '1300V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Introducción a Ciencias de la Computación',12,1, '1400V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Matemáticas para las Ciencias Aplicadas I',12,1, '1500M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Álgebra Superior II',10,2, '2100M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Estructuras de Datos',12,2, '2200V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Graficas y Juegos',10,2, '2300V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inglés II',4,2, '2400M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Matemáticas para las Ciencias Aplicadas II',12,2, '2500M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Álgebra Lineal I',10,3, '3100V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inglés III',4,3, '3200V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Matemáticas para las Ciencias Aplicadas III',12,3, '3300M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Modelado y Programación',10,3, '3400M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Probabilidad I',10,3, '3500V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Autómatas y Lenguajes Formales',10,4, '4100V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inglés IV',4,4, '4200M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Lógica Computacional',10,4, '4300M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Matemáticas para las Ciencias Aplicadas IV',12,4, '4400V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Organización y Arquitectura de Computadoras',10,4, '4500V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Análisis de Algoritmos',10,5, '5100M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Lenguajes de Programación',10,5, '5200M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Computación Distribuida',10,5, '5300V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Fundamentos de Bases de Datos',10,5, '5400V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inglés V',4,5, '5500M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Ingeniería de Software',10,6, '6100M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Inteligencia Artificial',10,6, '6200V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Sistemas Operativos',10,6, '6300V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Compiladores',10,7, '7100M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Complejidad Computacional',10,7, '7200M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Redes de Computadoras',10,7, '7300V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Computación Concurrente',10,8, '8100V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Criptografía y Seguridad',10,8, '8200M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Algoritmos Paralelos',10,6, '6661M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Análisis Numérico',10,6, '6662V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Computación Cuántica I',10,7, '7771V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Cómputo Evolutivo',10,7, '7772M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Estadística I',10,8, '8881M');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Geometría Moderna I',10,8, '8882V');
INSERT INTO Asignatura (Nombre, Creditos, Semestre, ID_Grupo) VALUES ('Lenguajes de Programación II',10,8, '8883V');

-- Asignatura dias

INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Algebra Superior I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Algebra Superior I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Estructuras Discretas');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Estructuras Discretas');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Inglés I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Inglés I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Introducción a Ciencias de la Computación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Introducción a Ciencias de la Computación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Matemáticas para las Ciencias Aplicadas I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Matemáticas para las Ciencias Aplicadas I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Álgebra Superior II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Álgebra Superior II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Estructuras de Datos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Estructuras de Datos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Graficas y Juegos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Graficas y Juegos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Inglés II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Inglés II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Matemáticas para las Ciencias Aplicadas II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Matemáticas para las Ciencias Aplicadas II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Álgebra Lineal I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Álgebra Lineal I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Inglés III');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Inglés III');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Matemáticas para las Ciencias Aplicadas III');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Matemáticas para las Ciencias Aplicadas III');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Modelado y Programación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Modelado y Programación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Probabilidad I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Probabilidad I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Autómatas y Lenguajes Formales');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Autómatas y Lenguajes Formales');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Inglés IV');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Inglés IV');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Lógica Computacional');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Lógica Computacional');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Matemáticas para las Ciencias Aplicadas IV');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Matemáticas para las Ciencias Aplicadas IV');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Organización y Arquitectura de Computadoras');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Organización y Arquitectura de Computadoras');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Análisis de Algoritmos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Análisis de Algoritmos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Lenguajes de Programación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Lenguajes de Programación');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Computación Distribuida');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Computación Distribuida');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Fundamentos de Bases de Datos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Fundamentos de Bases de Datos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Inglés V');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Inglés V');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Ingeniería de Software');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Ingeniería de Software');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Inteligencia Artificial');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Inteligencia Artificial');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Sistemas Operativos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Sistemas Operativos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Compiladores');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Compiladores');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Complejidad Computacional');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Complejidad Computacional');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Redes de Computadoras');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Redes de Computadoras');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Computación Concurrente');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Computación Concurrente');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Criptografía y Seguridad');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Criptografía y Seguridad');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Algoritmos Paralelos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Algoritmos Paralelos');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Análisis Numérico');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Análisis Numérico');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Computación Cuántica I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Computación Cuántica I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Cómputo Evolutivo');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Cómputo Evolutivo');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Martes','Estadística I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Jueves','Estadística I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Geometría Moderna I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Viernes','Geometría Moderna I');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Lunes','Lenguajes de Programación II');
INSERT INTO Asignatura_Dias (Dias, Nombre) VALUES ('Miercoles','Lenguajes de Programación II');

-- Asignatura horas

INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('7:00','Algebra Superior I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('8:00','Algebra Superior I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('9:00','Estructuras Discretas');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('10:00','Estructuras Discretas');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('11:00','Inglés I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('12:00','Inglés I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('13:00','Introducción a Ciencias de la Computación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('14:00','Introducción a Ciencias de la Computación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('15:00','Matemáticas para las Ciencias Aplicadas I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('16:00','Matemáticas para las Ciencias Aplicadas I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('17:00','Álgebra Superior II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('18:00','Álgebra Superior II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('19:00','Estructuras de Datos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('20:00','Estructuras de Datos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('21:00','Graficas y Juegos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('22:00','Graficas y Juegos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('7:00','Inglés II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('8:00','Inglés II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('9:00','Matemáticas para las Ciencias Aplicadas II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('10:00','Matemáticas para las Ciencias Aplicadas II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('11:00','Álgebra Lineal I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('12:00','Álgebra Lineal I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('13:00','Inglés III');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('14:00','Inglés III');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('15:00','Matemáticas para las Ciencias Aplicadas III');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('16:00','Matemáticas para las Ciencias Aplicadas III');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('17:00','Modelado y Programación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('18:00','Modelado y Programación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('19:00','Probabilidad I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('20:00','Probabilidad I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('21:00','Autómatas y Lenguajes Formales');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('22:00','Autómatas y Lenguajes Formales');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('7:00','Inglés IV');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('8:00','Inglés IV');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('9:00','Lógica Computacional');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('10:00','Lógica Computacional');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('11:00','Matemáticas para las Ciencias Aplicadas IV');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('12:00','Matemáticas para las Ciencias Aplicadas IV');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('13:00','Organización y Arquitectura de Computadoras');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('14:00','Organización y Arquitectura de Computadoras');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('15:00','Análisis de Algoritmos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('16:00','Análisis de Algoritmos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('17:00','Lenguajes de Programación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('18:00','Lenguajes de Programación');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('19:00','Computación Distribuida');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('20:00','Computación Distribuida');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('21:00','Fundamentos de Bases de Datos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('22:00','Fundamentos de Bases de Datos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('7:00','Inglés V');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('8:00','Inglés V');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('9:00','Ingeniería de Software');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('10:00','Ingeniería de Software');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('11:00','Inteligencia Artificial');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('12:00','Inteligencia Artificial');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('13:00','Sistemas Operativos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('14:00','Sistemas Operativos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('15:00','Compiladores');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('16:00','Compiladores');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('17:00','Complejidad Computacional');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('18:00','Complejidad Computacional');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('19:00','Redes de Computadoras');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('20:00','Redes de Computadoras');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('21:00','Computación Concurrente');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('22:00','Computación Concurrente');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('7:00','Criptografía y Seguridad');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('8:00','Criptografía y Seguridad');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('9:00','Algoritmos Paralelos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('10:00','Algoritmos Paralelos');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('11:00','Análisis Numérico');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('12:00','Análisis Numérico');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('13:00','Computación Cuántica I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('14:00','Computación Cuántica I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('15:00','Cómputo Evolutivo');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('16:00','Cómputo Evolutivo');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('17:00','Estadística I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('18:00','Estadística I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('19:00','Geometría Moderna I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('20:00','Geometría Moderna I');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('21:00','Lenguajes de Programación II');
INSERT INTO Asignatura_Horas (Horas, Nombre) VALUES ('22:00','Lenguajes de Programación II');

-- Grupo

INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('1100M',3,20231,1);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('1200M',3,20231,2);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('1300V',3,20231,3);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('1400V',3,20231,4);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('1500M',3,20231,5);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('2100M',3,20222,6);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('2200V',3,20222,7);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('2300V',3,20222,8);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('2400M',3,20222,9);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('2500M',3,20222,10);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('3100V',2,20221,11);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('3200V',2,20221,12);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('3300M',2,20221,13);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('3400M',2,20221,14);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('3500V',2,20221,15);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('4100V',2,20212,16);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('4200M',2,20212,17);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('4300M',2,20212,18);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('4400V',2,20212,19);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('4500V',2,20212,20);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('5100M',2,20211,1);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('5200M',2,20211,2);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('5300V',2,20211,3);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('5400V',2,20211,4);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('5500M',2,20211,5);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('6100M',2,20202,6);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('6200V',2,20202,7);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('6300V',2,20202,8);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('7100M',2,20201,9);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('7200M',2,20201,10);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('7300V',2,20201,11);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('8100V',2,20192,12);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('8200M',2,20192,13);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('6661M',2,20202,14);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('6662V',2,20202,15);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('7771V',2,20201,16);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('7772M',2,20201,17);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('8881M',2,20192,18);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('8882V',2,20192,19);
INSERT INTO Grupo (ID_Grupo, Cupo, ID_Periodo, ID) VALUES ('8883V',2,20192,20);

-- Periodo

INSERT INTO Periodo (ID_Periodo) VALUES (20232);
INSERT INTO Periodo (ID_Periodo) VALUES (20231);
INSERT INTO Periodo (ID_Periodo) VALUES (20222);
INSERT INTO Periodo (ID_Periodo) VALUES (20221);
INSERT INTO Periodo (ID_Periodo) VALUES (20212);
INSERT INTO Periodo (ID_Periodo) VALUES (20211);
INSERT INTO Periodo (ID_Periodo) VALUES (20202);
INSERT INTO Periodo (ID_Periodo) VALUES (20201);
INSERT INTO Periodo (ID_Periodo) VALUES (20192);
INSERT INTO Periodo (ID_Periodo) VALUES (20191);
INSERT INTO Periodo (ID_Periodo) VALUES (20182);
INSERT INTO Periodo (ID_Periodo) VALUES (20181);
INSERT INTO Periodo (ID_Periodo) VALUES (20172);
INSERT INTO Periodo (ID_Periodo) VALUES (20171);
INSERT INTO Periodo (ID_Periodo) VALUES (20162);
INSERT INTO Periodo (ID_Periodo) VALUES (20161);
INSERT INTO Periodo (ID_Periodo) VALUES (20152);
INSERT INTO Periodo (ID_Periodo) VALUES (20151);
INSERT INTO Periodo (ID_Periodo) VALUES (20142);
INSERT INTO Periodo (ID_Periodo) VALUES (20141);
INSERT INTO Periodo (ID_Periodo) VALUES (20132);
INSERT INTO Periodo (ID_Periodo) VALUES (20131);

-- Alumnos 

--Alumnos de 1er Semestre

INSERT INTO ALUMNO VALUES ('Sebastián', 'Torres', 320000001, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Juan', 'Aduna', 320000002, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Alonso', 'Larralde', 320000003, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Francisco', 'Ramírez', 320000004, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Andrea', 'Castañeda', 320000005, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Luz', 'Navarro', 320000006, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Pamela', 'López', 320000007, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Miriam', 'Silva', 320000008, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Paola', 'Hernández', 320000009, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Sofía', 'Sánchez', 320000010, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Julián', 'González', 320000011, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Brenda', 'Gutiérrez', 320000012, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Cristopher', 'Tapia', 320000013, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('José', 'Rodríguez', 320000014, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Alberto', 'Rivero', 320000015, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Natalia', 'Medina', 320000016, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Isabel', 'Dorantes', 320000017, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Julio', 'Muñoz', 320000018, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Fanny', 'Cortes', 320000019, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Aranza', 'Pulido', 320000020, 'Matutino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Yusneli', 'Ulloa', 320000021, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Angel', 'Cuevas', 320000022, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Aarón', 'Álvarez', 320000023, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Abigail', 'Solano', 320000024, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Abisay', 'Paredes', 320000025, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Abraham', 'Mendoza', 320000026, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Axel', 'Tellez', 320000027, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Adair', 'Ibarra', 320000028, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Adan', 'Ramos', 320000029, 'Vespertino', 2021, 4, 1,20231);
INSERT INTO ALUMNO VALUES ('Adolfo', 'Zamora', 320000030, 'Vespertino', 2021, 4, 1,20231);

--Alumnos de 3er Semestre

INSERT INTO ALUMNO VALUES ('Adrian', 'Villeda', 319000001, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Adriana', 'Galindo', 319000002, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Airi', 'Jandette', 319000003, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alain', 'Aguirre', 319000004, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alan', 'García', 319000005, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Jonathan', 'Cordero', 319000006, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alaric', 'Vicenteño', 319000007, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Brandon', 'Velázquez', 319000008, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Aldo', 'Santana', 319000009, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Emiliano', 'Monroy', 319000010, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alejandro', 'Domínguez', 319000011, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Nestor', 'Zenil', 319000012, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Oscar', 'Estefes', 319000013, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Marcos', 'Salazar', 319000014, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Ricardo', 'Laguna', 319000015, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alejandra', 'Aguilar', 319000016, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alessandra', 'Resendis', 319000017, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Susana', 'Ordoñez', 319000018, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Sara', 'Choreño', 319000019, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Monserrat', 'Camacho', 319000020, 'Matutino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Melissa', 'Vázquez', 319000021, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Violeta', 'Chavarria', 319000022, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Lupita', 'Ortiz', 319000023, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('María', 'Cobos', 319000024, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Elena', 'Ramos', 319000025, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Evelin', 'Flores', 319000026, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Arlette', 'Lira', 319000027, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alondra', 'Villegas', 319000028, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Yoselin', 'Villa', 319000029, 'Vespertino', 2020, 4, 3,20221);
INSERT INTO ALUMNO VALUES ('Alma', 'Elizalde', 319000030, 'Vespertino', 2020, 4, 3,20221);

--Alumnos de 5o Semestre

INSERT INTO ALUMNO VALUES ('Elizabeth', 'Pacheco', 318000001, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Fernanda', 'Meléndez', 318000002, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Patricia', 'Villanueva', 318000003, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Ana', 'Bureos', 318000004, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Alonso', 'Jiménez', 318000005, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Miranda', 'Barrera', 318000006, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Verónica', 'Manríquez', 318000007, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Amanda', 'Dolores', 318000008, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Anahí', 'Solis', 318000009, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Erick', 'Campos', 318000010, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Arturo', 'Víquez', 318000011, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Haziel', 'Pineda', 318000012, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Enrique', 'Montaño', 318000013, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('David', 'Mimbrera', 318000014, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Alisson', 'Avalos', 318000015, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Aurora', 'Domo', 318000016, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Beatriz', 'Sandoval', 318000017, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Benjamín', 'Bravo', 318000018, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Bernardo', 'Rojas', 318000019, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Braulio', 'Juárez', 318000020, 'Matutino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Blanca', 'Núñez', 318000021, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Bruno', 'Dueñas', 318000022, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Cesar', 'Ríos', 318000023, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Camila', 'Trejo', 318000024, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Cristina', 'Santillán', 318000025, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Carlos', 'Ortega', 318000026, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Cintia', 'Huerta', 318000027, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Cristian', 'Romero', 318000028, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Eliseo', 'Venegas', 318000029, 'Vespertino', 2019, 4, 5,20211);
INSERT INTO ALUMNO VALUES ('Tania', 'Villalobos', 318000030, 'Vespertino', 2019, 4, 5,20211);

--Cursa

--Alumnos de Nuevo Ingreso
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000001, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000001, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000001, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000001, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000001, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000002, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000002, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000002, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000002, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000002, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000003, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000003, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000003, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000003, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000003, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000004, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000004, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000004, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000004, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000004, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000005, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000005, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000005, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000005, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000005, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000006, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000006, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000006, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000006, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000006, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000007, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000007, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000007, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000007, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000007, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000008, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000008, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000008, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000008, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000008, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000009, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000009, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000009, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000009, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000009, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000010, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000010, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000010, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000010, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000010, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000011, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000011, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000011, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000011, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000011, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000012, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000012, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000012, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000012, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000012, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000013, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000013, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000013, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000013, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000013, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000014, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000014, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000014, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000014, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000014, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000015, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000015, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000015, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000015, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000015, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000016, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000016, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000016, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000016, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000016, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000017, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000017, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000017, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000017, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000017, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000018, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000018, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000018, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000018, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000018, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000019, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000019, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000019, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000019, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000019, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000020, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000020, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000020, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000020, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000020, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000021, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000021, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000021, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000021, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000021, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000022, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000022, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000022, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000022, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000022, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000023, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000023, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000023, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000023, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000023, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000024, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000024, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000024, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000024, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000024, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000025, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000025, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000025, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000025, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000025, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000026, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000026, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000026, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000026, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000026, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000027, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000027, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000027, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000027, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000027, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000028, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000028, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000028, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000028, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000028, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000029, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000029, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000029, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000029, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000029, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000030, 'Inglés I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000030, 'Algebra Superior I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000030, 'Introducción a Ciencias de la Computación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000030, 'Matemáticas para las Ciencias Aplicadas I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 320000030, 'Estructuras Discretas', 0);


--Alumnos de Tercer Semestre 
--Primer Semestre para los de 3er Semestre 

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000001, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000001, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000003, 'Introducción a Ciencias de la Computación', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000004, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000006, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000008, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000008, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Algebra Superior I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000010, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000010, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000011, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000011, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000012, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000012, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000018, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000019, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000019, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000021, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000022, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000025, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000026, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000027, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000027, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Matemáticas para las Ciencias Aplicadas I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Inglés I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Algebra Superior I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Estructuras Discretas', 9);

--Segundo Semestre para Alumnos de 3er Semestre
-------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000001, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Inglés II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000002, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Estructuras de Datos', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000003, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000003, 'Graficas y Juegos', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Inglés II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000004, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000004, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000005, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000005, 'Graficas y Juegos', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Inglés II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000006, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Álgebra Superior II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000007, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Inglés II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000008, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000008, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000008, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Álgebra Superior II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000009, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000010, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000011, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000011, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000012, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000012, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000013, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000014, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000014, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000014, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000015, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Estructuras de Datos', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000016, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000017, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000018, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Inglés II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000019, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000020, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000021, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000021, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000021, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000022, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000023, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000024, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000025, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000026, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000026, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000027, 'Álgebra Superior II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000027, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000027, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000028, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 319000028, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000029, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000029, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000029, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 319000030, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 319000030, 'Graficas y Juegos', 10);


--Tercer Semestre para los de 3o
----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000001, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000001, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000001, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000001, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000001, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000002, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000002, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000002, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000002, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000002, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000003, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000003, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000003, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000003, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000003, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000004, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000004, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000004, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000004, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000004, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000005, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000005, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000005, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000005, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000005, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000006, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000006, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000006, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000006, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000006, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000007, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000007, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000007, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000007, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000007, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000008, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000008, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000008, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000008, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000008, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000009, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000009, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000009, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000009, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000009, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000010, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000010, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000010, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000010, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000010, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000011, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000011, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000011, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000011, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000011, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000012, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000012, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000012, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000012, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000012, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000013, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000013, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000013, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000013, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000013, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000014, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000014, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000014, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000014, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000014, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000015, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000015, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000015, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000015, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000015, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000016, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000016, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000016, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000016, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000016, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000017, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000017, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000017, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000017, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000017, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000018, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000018, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000018, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000018, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000018, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000019, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000019, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000019, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000019, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000019, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000020, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000020, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000020, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000020, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000020, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000021, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000021, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000021, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000021, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000021, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000022, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000022, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000022, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000022, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000022, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000023, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000023, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000023, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000023, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000023, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000024, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000024, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000024, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000024, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000024, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000025, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000025, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000025, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000025, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000025, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000026, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000026, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000026, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000026, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000026, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000027, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000027, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000027, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000027, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000027, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000028, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000028, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000028, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000028, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000028, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000029, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000029, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000029, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000029, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000029, 'Modelado y Programación', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000030, 'Inglés III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000030, 'Álgebra Lineal I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000030, 'Probabilidad I', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000030, 'Matemáticas para las Ciencias Aplicadas III', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 319000030, 'Modelado y Programación', 0);

--Alumnos de Quinto Semestre 
--Primer Semestre para los de 5o
----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000001, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000001, 'Estructuras Discretas', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Introducción a Ciencias de la Computación', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Algebra Superior I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000012, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000012, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000013, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000014, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000014, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000017, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Estructuras Discretas', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000018, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000018, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000021, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Estructuras Discretas', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000022, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000023, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000023, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Inglés I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Algebra Superior I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Matemáticas para las Ciencias Aplicadas I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Estructuras Discretas', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Inglés I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Algebra Superior I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Introducción a Ciencias de la Computación', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Matemáticas para las Ciencias Aplicadas I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Estructuras Discretas', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Inglés I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Algebra Superior I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Introducción a Ciencias de la Computación', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Matemáticas para las Ciencias Aplicadas I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Inglés I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Algebra Superior I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Introducción a Ciencias de la Computación', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Matemáticas para las Ciencias Aplicadas I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Estructuras Discretas', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Inglés I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Algebra Superior I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Introducción a Ciencias de la Computación', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Matemáticas para las Ciencias Aplicadas I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Estructuras Discretas', 9);

--Segundo Semestre para los de 5o
----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Inglés II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000003, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Estructuras de Datos', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Graficas y Juegos', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Inglés II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000005, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Graficas y Juegos', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000006, 'Inglés II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000006, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000007, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Álgebra Superior II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000007, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000007, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Inglés II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Álgebra Superior II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000012, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000013, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Álgebra Superior II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000013, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000014, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000015, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000016, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Estructuras de Datos', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000017, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Matemáticas para las Ciencias Aplicadas II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Inglés II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Estructuras de Datos', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Estructuras de Datos', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000022, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000022, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Álgebra Superior II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Matemáticas para las Ciencias Aplicadas II', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Graficas y Juegos', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000026, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000026, 'Matemáticas para las Ciencias Aplicadas II', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Graficas y Juegos', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Álgebra Superior II', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000027, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000027, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Graficas y Juegos', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000028, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Matemáticas para las Ciencias Aplicadas II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Graficas y Juegos', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Inglés II', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Álgebra Superior II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Estructuras de Datos', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Matemáticas para las Ciencias Aplicadas II', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Graficas y Juegos', 10);

--Tercer Semestre para los de 5o
-------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Álgebra Lineal I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Inglés III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Álgebra Lineal I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Probabilidad I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Matemáticas para las Ciencias Aplicadas III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Álgebra Lineal I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Modelado y Programación', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Álgebra Lineal I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Matemáticas para las Ciencias Aplicadas III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Álgebra Lineal I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Modelado y Programación', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Inglés III', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Álgebra Lineal I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Probabilidad I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Modelado y Programación', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Álgebra Lineal I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Matemáticas para las Ciencias Aplicadas III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Modelado y Programación', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Inglés III', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000009, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Matemáticas para las Ciencias Aplicadas III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Modelado y Programación', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Inglés III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000011, 'Probabilidad I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000011, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Probabilidad I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Modelado y Programación', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Álgebra Lineal I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Probabilidad I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Modelado y Programación', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Inglés III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Probabilidad I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000017, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000017, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Modelado y Programación', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Inglés III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000018, 'Probabilidad I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Modelado y Programación', 6);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Matemáticas para las Ciencias Aplicadas III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000022, 'Probabilidad I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000023, 'Probabilidad I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000023, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000024, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Probabilidad I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000024, 'Matemáticas para las Ciencias Aplicadas III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Probabilidad I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000026, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Inglés III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Probabilidad I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000027, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000027, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Inglés III', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Álgebra Lineal I', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Matemáticas para las Ciencias Aplicadas III', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Modelado y Programación', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Álgebra Lineal I', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Probabilidad I', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Modelado y Programación', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Inglés III', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Álgebra Lineal I', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000030, 'Probabilidad I', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Matemáticas para las Ciencias Aplicadas III', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Modelado y Programación', 8);

--Cuarto Semestre para los Alumnos de 5o Semestre
---------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, true, 318000001, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Autómatas y Lenguajes Formales', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000001, 'Lógica Computacional', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Matemáticas para las Ciencias Aplicadas IV', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000002, 'Lógica Computacional', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000003, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Autómatas y Lenguajes Formales', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000004, 'Lógica Computacional', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000005, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Inglés IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000006, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000007, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000008, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000008, 'Autómatas y Lenguajes Formales', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000008, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000008, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000009, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Autómatas y Lenguajes Formales', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000010, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000011, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000011, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000011, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000012, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Autómatas y Lenguajes Formales', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Matemáticas para las Ciencias Aplicadas IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000013, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Inglés IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000014, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000015, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Autómatas y Lenguajes Formales', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000016, 'Lógica Computacional', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Autómatas y Lenguajes Formales', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000017, 'Lógica Computacional', 7);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Matemáticas para las Ciencias Aplicadas IV', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000018, 'Lógica Computacional', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000019, 'Matemáticas para las Ciencias Aplicadas IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000019, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000020, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Autómatas y Lenguajes Formales', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000020, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000020, 'Lógica Computacional', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000021, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000021, 'Lógica Computacional', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Inglés IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Autómatas y Lenguajes Formales', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000022, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000022, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Inglés IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000023, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000023, 'Matemáticas para las Ciencias Aplicadas IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000023, 'Lógica Computacional', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Inglés IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000024, 'Organización y Arquitectura de Computadoras', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Matemáticas para las Ciencias Aplicadas IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000024, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000025, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Autómatas y Lenguajes Formales', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000025, 'Matemáticas para las Ciencias Aplicadas IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000025, 'Lógica Computacional', 10);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Organización y Arquitectura de Computadoras', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Autómatas y Lenguajes Formales', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000026, 'Matemáticas para las Ciencias Aplicadas IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000026, 'Lógica Computacional', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Inglés IV', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000027, 'Organización y Arquitectura de Computadoras', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (3, false, 318000027, 'Autómatas y Lenguajes Formales', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Matemáticas para las Ciencias Aplicadas IV', 6);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000027, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Inglés IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Autómatas y Lenguajes Formales', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000028, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000028, 'Lógica Computacional', 8);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Inglés IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Organización y Arquitectura de Computadoras', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Autómatas y Lenguajes Formales', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (2, false, 318000029, 'Matemáticas para las Ciencias Aplicadas IV', 8);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000029, 'Lógica Computacional', 9);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Inglés IV', 7);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Organización y Arquitectura de Computadoras', 9);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Autómatas y Lenguajes Formales', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Matemáticas para las Ciencias Aplicadas IV', 10);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (1, true, 318000030, 'Lógica Computacional', 8);

--Quinto Semestre A para los Alumnos de 5o Semestre
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000001, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000001, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000001, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000001, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000001, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000002, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000002, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000002, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000002, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000002, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000003, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000003, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000003, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000003, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000003, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000004, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000004, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000004, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000004, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000004, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000005, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000005, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000005, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000005, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000005, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000006, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000006, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000006, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000006, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000006, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000007, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000007, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000007, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000007, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000007, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000008, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000008, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000008, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000008, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000008, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000009, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000009, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000009, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000009, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000009, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000010, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000010, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000010, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000010, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000010, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000011, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000011, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000011, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000011, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000011, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000012, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000012, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000012, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000012, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000012, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000013, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000013, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000013, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000013, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000013, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000014, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000014, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000014, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000014, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000014, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000015, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000015, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000015, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000015, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000015, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000016, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000016, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000016, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000016, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000016, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000017, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000017, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000017, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000017, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000017, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000018, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000018, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000018, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000018, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000018, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000019, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000019, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000019, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000019, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000019, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000020, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000020, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000020, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000020, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000020, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000021, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000021, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000021, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000021, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000021, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000022, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000022, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000022, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000022, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000022, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000023, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000023, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000023, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000023, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000023, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000024, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000024, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000024, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000024, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000024, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000025, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000025, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000025, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000025, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000025, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000026, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000026, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000026, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000026, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000026, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000027, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000027, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000027, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000027, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000027, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000028, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000028, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000028, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000028, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000028, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000029, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000029, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000029, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000029, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000029, 'Fundamentos de Bases de Datos', 0);

INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000030, 'Inglés V', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000030, 'Análisis de Algoritmos', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000030, 'Lenguajes de Programación', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000030, 'Computación Distribuida', 0);
INSERT INTO Cursa (Num_VecesCursada, Ordinario, NumCuenta, Nombre, Calificacion) VALUES (0, true, 318000030, 'Fundamentos de Bases de Datos', 0);