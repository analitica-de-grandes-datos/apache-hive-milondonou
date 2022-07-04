/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS Text;
DROP TABLE IF EXISTS Result;
CREATE TABLE Text (
    letter   string,
    calendar     string,
    value    int
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE Text;


CREATE TABLE Result 
    AS 
        SELECT DISTINCT value FROM Text 
            ORDER BY value ASC
	    LIMIT 5;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM Result;

