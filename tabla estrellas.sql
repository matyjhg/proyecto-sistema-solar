DROP TABLE IF EXISTS estrellas;  -- se utiliza para eliminar una tabla existente de la base de datos.


CREATE TABLE estrellas (
    id_estrellas INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30),
    magnitud FLOAT,
    distancia_a_tierra FLOAT,
    edad FLOAT,
    PRIMARY KEY (id_estrellas)
) ENGINE=InnoDB;
