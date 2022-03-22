--que la calificacion no pueda ser negativa (hay que añadir un atributo prueba que calificacion)

CREATE OR REPLACE FUNCTION revisarNota() RETURNS trigger AS $revisarNota$
    BEGIN        
        IF NEW.Calificacion < 0 THEN
          NEW.Calificacion = 0;
        END IF;
        RETURN NEW;
    END; 
$revisarNota$ LANGUAGE plpgsql;

--DROP TRIGGER IF EXISTS nota;
CREATE TRIGGER nota
    BEFORE INSERT ON Prueba
    FOR EACH ROW
      EXECUTE PROCEDURE revisarNota();

 
SELECT * FROM PRUEBA;
INSERT INTO Prueba (Estudiante_id, Curso_id, Profesor_id, Descripcion, Fecha_publicacion, Calificacion) 
VALUES
(2,2,2,'Tercer examen bases de datos','2007-06-30 10:17:25-07',-1);
SELECT * FROM PRUEBA;

 
-- si se cambia el tipo de pregunta de cerrada a abierta se eliminen las posibles respuestas de dicha pregunta

CREATE OR REPLACE FUNCTION primeraMayuscula() RETURNS trigger AS $primeraMayuscula$
    BEGIN        
        NEW.Nombre = initcap(NEW.Nombre);
        RETURN NEW;
    END;
$primeraMayuscula$ LANGUAGE plpgsql;

CREATE TRIGGER primeraMayuscula_trigger BEFORE INSERT OR UPDATE ON Administrador
    FOR EACH ROW EXECUTE PROCEDURE primeraMayuscula();



CREATE OR REPLACE FUNCTION cambioPregunta() RETURNS trigger AS $cambioPregunta$
    BEGIN        
        IF NEW.tipo = 'Abierta' and OLD.tipo = 'Cerrada' THEN
          delete from posiblerespuesta
 			where pregunta_id = new.Pregunta_id; 
        END IF;
        RETURN NEW;
    END; 
$cambioPregunta$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tipo_pregunta1 on pregunta;
CREATE TRIGGER tipo_pregunta1
    AFTER UPDATE ON pregunta
    FOR EACH ROW
      EXECUTE PROCEDURE cambioPregunta();

SELECT * from posiblerespuesta;
SELECT * from pregunta;
UPDATE  pregunta set tipo = 'Abierta' WHERE pregunta_id = 2;
