CREATE SCHEMA tienda;

USE tienda;
/*creacion de tablas*/

CREATE TABLE categria (
	categoria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	categoria_general VARCHAR(30),
	subcategoria VARCHAR(30)
);

CREATE TABLE productos (
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre_producto VARCHAR(30),
	categoria_id INTEGER,
	valor_venta INTEGER,
	FOREIGN KEY (categoria_id) REFERENCES categria(categoria_id)
);

CREATE TABLE provedores (
	provedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(30)
);

CREATE TABLE boletas (
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	total_compra INTEGER,
	medio_pago VARCHAR(30),
	timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carros (
	carro_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	boleta_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER,
	FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);


/*relacional*/

CREATE TABLE provedor_producto (
	provedor_producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	provedor_id INTEGER,
	producto_id INTEGER,
	valor_provedor INTEGER,
	FOREIGN KEY (provedor_id) REFERENCES provedores(provedor_id),
	FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

/* Insertar Datos */

INSERT INTO categria (categoria_general, subcategoria) VALUES
	("Fiambre", "Jamon"),
	("Abarrotes", "Pastas"),
	("Abarrotes", "Arroz"),
	("Abarrotes", "Pan"),
	("Higiene y Salud", "Corporal")
;

INSERT INTO productos (nombre_producto, categoria_id, valor_venta) VALUES ("Shampoo", 5, 2000),
	("Fideos Maxima", 2, 800),
	("Jamon Acaramelado 1/4", 1, 1500),
	("Arroz", 3, 2000),
	("Marraqueta 1k", 3, 1800),
	("Desodorante", 5, 4000)
;
INSERT INTO boletas (total_compra, medio_pago) VALUES (50000, "efectivo");

SELECT * FROM productos;
/*este comando muestra todas las boletas segun el año*/
SELECT * FROM boletas WHERE YEAR(timestamp) = 2023;


/*join*/

SELECT productos.nombre_producto, categria.categoria_general, categria.subcategoria
FROM productos JOIN categria ON productos.categoria_id = categria.categoria_id;
