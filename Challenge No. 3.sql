--PROCEDIMIENTO 1
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

-- Para Poder visualizar este procedimento, se requiere correr la vista primero
--SELECT * FROM calificaciones_estudiante;

call calificar_prueba (1);

--SELECT * FROM calificaciones_estudiante;

--PROCEDIMIENTO 2
--un procedimiento que reciba un administrador_id y actualize el regitro de ese adeministrador con una contrasenha mas segura
CREATE OR REPLACE PROCEDURE crear_contrasenha(Administrador_idUwU INT)
    AS $crear_contrasenha$
    DECLARE
    	char1 CHAR = '';
	 	temp_sum CHAR = '';
    	charI INT  = 0;
    	password1 VARCHAR(100) = '';
    	len INT = 12;
    BEGIN
        IF EXISTS(SELECT * FROM Administrador AS A WHERE A.Administrador_id = Administrador_idUwU) THEN
            BEGIN            
                WHILE len > 0 LOOP
                    BEGIN
                    	charI = floor(random() * 100 + 1)::int;
        				IF charI > 48 AND charI < 122 THEN
        					BEGIN
          						password1 := CONCAT(password1,CHR(charI));
          						len := len - 1;
                    		END;
                    	END IF;
                   	END;
                END LOOP;
                UPDATE Administrador AS A
                SET Contrasenha = password1
                WHERE A.Administrador_id = Administrador_idUwU;
            END;
        ELSE
            RAISE EXCEPTION 'No existe el administrador con ese id';        
        END IF;
    END;
$crear_contrasenha$ LANGUAGE plpgsql;

SELECT * FROM administrador;
CALL crear_contrasenha(1);
SELECT * FROM administrador;