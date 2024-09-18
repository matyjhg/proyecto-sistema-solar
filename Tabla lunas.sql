DROP TABLE IF EXISTS lunas; -- se utiliza para eliminar una tabla existente de la base de datos.

CREATE TABLE lunas (
    id_lunas INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    planeta_id INT, -- ID del planeta al que pertenece
    diametro FLOAT,
    distancia_al_planeta FLOAT,
    PRIMARY KEY (id_lunas),
    FOREIGN KEY (planeta_id) REFERENCES planetas(id_planetas) -- Referencia a la tabla planetas
) ENGINE=InnoDB;
