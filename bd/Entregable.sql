create database Entregable;

use Entregable;

CREATE TABLE Entregable.usuarios (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	nota_gestionada_id INT NULL,
	CONSTRAINT usuarios_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE Entregable.notas (
	id INT auto_increment NOT NULL,
	titulo varchar(100) NOT NULL,
	descripcion TEXT NOT NULL,
	categoria_id INT NOT NULL,
	CONSTRAINT notas_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE Entregable.nota_gestionada (
	id INT auto_increment NOT NULL,
	usuario_id INT NOT NULL,
	nota_id INT NOT NULL,
	CONSTRAINT nota_gestionada_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


CREATE TABLE Entregable.categorias (
	id INT auto_increment NOT NULL,
	nombre varchar(100) NOT NULL,
	nota_id INT NOT NULL,
	CONSTRAINT categorias_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


ALTER TABLE Entregable.usuarios ADD CONSTRAINT usuarios_FK FOREIGN KEY (nota_gestionada_id) REFERENCES Entregable.nota_gestionada(id);
ALTER TABLE Entregable.notas ADD CONSTRAINT notas_FK FOREIGN KEY (categoria_id) REFERENCES Entregable.categorias(id);
ALTER TABLE Entregable.nota_gestionada ADD CONSTRAINT nota_gestionada_FK FOREIGN KEY (nota_id) REFERENCES Entregable.notas(id);
ALTER TABLE Entregable.categorias ADD CONSTRAINT categorias_FK FOREIGN KEY (nota_id) REFERENCES Entregable.notas(id);
ALTER TABLE Entregable.nota_gestionada ADD CONSTRAINT nota_gestionada_FK_1 FOREIGN KEY (usuario_id) REFERENCES Entregable.usuarios(id);

