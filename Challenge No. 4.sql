CREATE OR REPLACE VIEW calificaciones_estudiante AS
SELECT E.Nombre, P.Calificacion AS "Calificacion total", G.Calificacion_pregunta AS "Calificacion Pregunta", G.RespuestaDelEstudiante, P.Descripcion FROM
		  Prueba AS P
			INNER JOIN Estudiante AS E 
       		ON (P.Estudiante_id = E.Estudiante_id)
      INNER JOIN Guardar_respuesta AS G
          ON (G.Prueba_id = P.Prueba_id);
