DROP TABLE IF EXISTS Administrador
CASCADE;
CREATE table Administrador (
    Administrador_id serial primary key,
    Nombre varchar(250) not null,
    Correo varchar(250),
    Descripcion varchar(250),
    Contrasenha varchar(250)
);
insert into Administrador (Nombre, Correo, Descripcion, Contrasenha) values
  ('pedro diaz', 'pedro@gmail.com', 'buena persona','pedro123' ),
  ('juan arcos', 'juan@gmail.com', 'buena persona','juan123' ),
  ('camilo cadavid', 'camilo@gmail.com', 'buena persona','camilo123' ),
  ('david castaño', 'david@gmail.com', 'buena persona','david123' ),
  ('karol turbay', 'karol@gmail.com', 'buena persona','karol123' );


DROP TABLE IF EXISTS Profesor
CASCADE;
CREATE table Profesor (
    Profesor_id serial primary key,
    Nombre varchar(250),
    Correo varchar(250),
    Descripcion varchar(250),
    Contrasenha varchar(250),
    Administrador_id int,
    FOREIGN KEY (Administrador_id)
          REFERENCES Administrador(Administrador_id)
);
INSERT INTO Profesor (Nombre, Correo, Descripcion, Contrasenha, Administrador_id)
VALUES
  ('Jhon Ruiz','pedro@gmail.com','Bajito','123',1),
  ('Orlando Puerto','orlando@gmail.com','Feito','456',2),
  ('Andres Castillo','andres@gmail.com','Llega tarde','789',3),
  ('Coper Ito','coper@gmail.com',' Es grosero','234',1),
  ('Fernando Ando','fernando@gmail.com','Da curva','567',1);


DROP TABLE IF EXISTS Estudiante
CASCADE;
CREATE table Estudiante
(
  Estudiante_id serial primary key,
  Profesor_id int,
  Nombre varchar(250),
  Correo varchar(250),
  Descripcion varchar(250),
  Contrasenha varchar(250),
  FOREIGN KEY(Profesor_id)
  REFERENCES Profesor(Profesor_id)
);
INSERT INTO Estudiante (Profesor_id,Nombre,Correo,Descripcion,Contrasenha)
VALUES
  (1,'Camilo Alvarez','camiloal@undominio.com','Le gusta la matematica','123456'),
  (2,'Alex Uribe','uribealex@undominio.com','No le gusta la matematica','asdf34324'),
  (3,'Andrea Castillo','soyandrea@undominio.com','Le gusta la literatura','jkhlhjk564'),
  (4,'Laura Suarez','laurasuarez@undominio.com','duerme mucho','poiiiiiiiikjh231'),
  (5,'Luisa Ramirez','raluisa@undominio.com','','poiiiiiiiikjh231');


DROP TABLE IF EXISTS Curso
CASCADE;
CREATE table Curso
(
  Curso_id serial primary key,
  Grupo int,
  Profesor_id int, 
  Administrador_id int,
  FOREIGN KEY(Profesor_id) 
        REFERENCES Profesor(Profesor_id),
  FOREIGN KEY (Administrador_id)
        REFERENCES Administrador(Administrador_id)
);
INSERT INTO Curso (Grupo, Profesor_id, Administrador_id)
VALUES
  (80,4 ,1),
  (01,1 ,2 ),
  (02,3 ,5 ),
  (01,4 ,4 ),
  (80, 2 , 5 );


DROP TABLE IF EXISTS Prueba
CASCADE;
CREATE table Prueba
(
  Prueba_id serial primary key,
  Estudiante_id int,
  Curso_id int,
  Profesor_id int,
  Descripcion varchar(250),
  Fecha_publicacion timestamp,
  Calificacion int,
  FOREIGN KEY (Estudiante_id) 
  REFERENCES Estudiante(Estudiante_id),
  FOREIGN KEY (Curso_id) 
  REFERENCES Curso(Curso_id),
  FOREIGN KEY (Profesor_id) 
  REFERENCES Profesor(Profesor_id)
);
INSERT INTO Prueba (Estudiante_id, Curso_id, Profesor_id, Descripcion, Fecha_publicacion, Calificacion) 
VALUES
  (2,1,2,'Primer examen bases de datos','2006-06-30 10:17:25-07',1),
  (2,2,3,'Primer examen FDP','2018-06-22 19:10:05-07',2),
  (3,4,5,'Segundo examen bases de datos','2020-06-25 23:10:25-07',5),
  (1,5,1,'Primer examen Calculo 1','2015-08-01 08:10:25-07',3),
  (1,1,1,'Primer examen FADA','2022-04-12 19:10:25-07',4);


DROP TABLE IF EXISTS Pregunta
CASCADE;
CREATE table Pregunta
(
  Pregunta_id serial primary key,
  Tipo varchar(50),
  Descripcion varchar(250),
  Prueba_id int,
  FOREIGN KEY(Prueba_id) 
        REFERENCES Prueba(Prueba_id)
);
INSERT INTO Pregunta(Tipo, Descripcion, Prueba_id)
VALUES
   ('Abierta', '¿Cuanto es uno mas uno?', 1),
   ('Cerrada', '¿Cuanto es uno mas dos?', 2),
   ('Cerrada', '¿Cuanto es uno mas tres?', 3),
   ('Cerrada', '¿Cuanto es uno mas cuatro?', 4),
   ('Abierta', '¿Cuanto es uno mas cinco?', 5);


DROP TABLE IF EXISTS Guardar_respuesta
CASCADE;
CREATE table Guardar_respuesta
(
  RespuestaDelEstudiante varchar(250),
  Pregunta_id int,
  Prueba_id int,
  Calificacion_pregunta int,
  FOREIGN KEY(Prueba_id) 
        REFERENCES Prueba(Prueba_id),
  FOREIGN KEY(Pregunta_id) 
        REFERENCES Pregunta(Pregunta_id)
);
INSERT INTO Guardar_respuesta (RespuestaDelEstudiante, Pregunta_id, Prueba_id,  Calificacion_pregunta)VALUES 
('No se',1,1,5),
('Si se',2,1,5),
('Tal vez',2,2,4),
('No se',3,1,5),
('Tal vez',1,2,4);


DROP TABLE IF EXISTS PosibleRespuesta
CASCADE;
CREATE table PosibleRespuesta
(
  PosibleRespuesta_id serial primary key, 
  Descripcion varchar(250),
  Pregunta_id int,
  EsCorrecta boolean,
  FOREIGN KEY(Pregunta_id) 
        REFERENCES Pregunta(Pregunta_id)
);
INSERT INTO PosibleRespuesta (Descripcion,  Pregunta_id, EsCorrecta) 
VALUES
  ('3',2,true), ('2',2,false), ('23',2,false),
  ('3',3,false),('4',3,true),('23',3,false),
  ('5',3,true),('45',3,false),('34',3,false);
  

DROP TABLE IF EXISTS Asiste
CASCADE;
create table Asiste(
    Estudiante_id int,
    Curso_id int,
    IP varchar(270),
    hora_login timestamp,
    primary key(Estudiante_id,Curso_id),
    FOREIGN KEY (Curso_id) 
      REFERENCES Curso(Curso_id),
    FOREIGN KEY (Estudiante_id) 
      REFERENCES Estudiante(Estudiante_id)
);
INSERT INTO Asiste (Estudiante_id, Curso_id, IP,hora_login)
VALUES
(1,2,'100.22.1','2016-06-22 19:10:25-07'),
(1,1,'192.158.1.38','2016-06-22 19:10:25-07'),
(4,2,'120.2.10','2016-06-22 19:10:25-07'),
(1,3,'100.22.19','2016-06-01 19:10:25-
  07');
  
  
