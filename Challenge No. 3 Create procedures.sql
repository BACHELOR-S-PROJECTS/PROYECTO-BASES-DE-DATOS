--procedimiento, al ser llamado con un id de una prueba, actualiza la nota total de la prueba segun las preguntas y respuestas del estudiante en esa prueba



CREATE OR REPLACE PROCEDURE calificar_prueba(Prueba_idUwU INT)
    AS $calificar_prueba$
    DECLARE
	temp_sum NUMERIC(4,2) = (SELECT AVG(Calificacion_pregunta) AS temp_sum FROM Guardar_respuesta AS G WHERE G.Prueba_id = Prueba_idUwU);
    BEGIN
        IF EXISTS(SELECT * FROM Prueba AS P WHERE P.Prueba_id = Prueba_id) THEN
            BEGIN
            
          
            
                UPDATE Prueba AS P
                SET Calificacion = temp_sum
                WHERE P.Prueba_id = Prueba_idUwU;
            END;
        ELSE
            RAISE EXCEPTION 'No existe la prueba con ese id';        
        END IF;
    END;
$calificar_prueba$ LANGUAGE plpgsql;

SELECT * FROM calificaciones_estudiante;

call calificar_prueba (1);

SELECT * FROM calificaciones_estudiante;
