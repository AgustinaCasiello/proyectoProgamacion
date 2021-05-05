CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE,
text VARCHAR(500),
articulos_carrito INT UNSIGNED
); 

CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
image_URL VARCHAR(250),
nombre VARCHAR(50) NOT NULL,
fecha_creacion DATE,
id_usuario INT UNSIGNED, 

FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);



CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha_creacion DATE,
id_usuario INT UNSIGNED,
id_producto INT UNSIGNED,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

ALTER TABLE comentarios
ADD text VARCHAR(200) NOT NULL;

ALTER TABLE usuarios
ADD nombre VARCHAR(50) NOT NULL;


INSERT INTO usuarios 
VALUES (DEFAULT, ('2021-01-29'), 'Haciendo las pruebas de MYSQL, esperos que todo salga según lo planeado.', 3, 'Diego33');

INSERT INTO usuarios 
VALUES (DEFAULT, ('2002-03-03'), 'Para mi el producto es perfecto.', 5, 'FRancoSantoro'); 

INSERT INTO usuarios 
VALUES (DEFAULT, ('2001-09-09'), 'NO LO COMPREN!! es terrible', 21, 'AnamariaMarcela');

INSERT INTO usuarios 
VALUES (DEFAULT, ('1998-04-23'), 'Faltan algunos detalles del producto, pero esta bien en general', 0, 'Sebastian56'); 

INSERT INTO usuarios 
VALUES (DEFAULT, ('1978-11-17'), 'No me llego lo que pedí', 1, 'MarceloJorge123');

INSERT INTO usuarios 
VALUES (DEFAULT, ('2005-11-14'), 'Producto no ecofriendly', 3, 'Greta Thumberg');

INSERT INTO usuarios 
VALUES (DEFAULT, ('2001-02-02'), 'JUan45@gmail.com', 22, 'Juan Sanchez');

INSERT INTO usuarios 
VALUES (DEFAULT, ('2000-12-12'), 'Silvina22@gmail.com', 1, 'Silvina Zampedri');

INSERT INTO usuarios 
VALUES (DEFAULT, ('2018-12-09'), 'Oso08@gmail.com', 4, 'Lucas Pratto');

INSERT INTO usuarios 
VALUES (DEFAULT, ('1976-09-11'), 'juanajason@gmail.com', 1, 'Juana Jason');

SELECT * FROM usuarios; 

INSERT INTO productos
VALUES (DEFAULT, '/images/autos/A3SEDAN1.jpg', 'Audi A3 Sedán', ('2021-01-29'), 1);

INSERT INTO productos
VALUES (DEFAULT, 'images/autos/840_560.jpg', 'Audi S3', ('2021-01-21'), 2);

INSERT INTO productos
VALUES (DEFAULT, '/images/autos/audi_a3.jpg ', 'Audi A3 Sportback', ('2021-01-12'), 3);

INSERT INTO productos
VALUES (DEFAULT, '/images/autos/r8.jpg', 'Audi R8 V8', ('2021-01-30'), 4);

INSERT INTO productos
VALUES (DEFAULT, '/images/autos/bmw-x6.jpg', 'BMW X6', ('2021-01-12'), 5);

INSERT INTO productos
VALUES (DEFAULT, '/images/autos/corolla.jpg', 'Toyota Corolla', ('2021-01-03'), 7);



INSERT INTO productos
VALUES (DEFAULT, '/images/autos/giulia.jpg', 'Alfa Romeo Giulia', ('2021-01-02'), 8);

INSERT INTO productos
VALUES (DEFAULT, 'https://i.blogs.es/b51f1c/mercedes-amg-a-45-4matic-2019-40-p/1366_2000.jpg', 'Mercedes Benz A45 Amg', ('2021-01-09'), 9);

INSERT INTO productos
VALUES (DEFAULT, 'https://automotiva.com.ar/wp-content/uploads/2018/05/Mercedes-Benz_E63_AMG-7.jpg', 'Mercedes Benz E63 Amg', ('2021-01-20'), 10);

DELETE FROM productos where id_usuario= 6

select * from usuarios;
update usuarios
set text = 'Franco@gmail.com'
where id = 2;

update usuarios
set text = 'Anamaria@gmail.com'
where id = 3;
update usuarios
set text = 'Seba@gmail.com'
where id = 4;
update usuarios
set text = 'Marcel@gmail.com'
where id = 5; 
update usuarios
set text = 'GretaPLanta@gmail.com'
where id = 6

select * from comentarios



INSERT INTO comentarios
VALUES (DEFAULT, ('2021-04-02'), 3, 19, 'Viene con 8 velocidades?');
INSERT INTO comentarios
VALUES (DEFAULT, ('2021-01-25'), 4, 19, 'Lo cambiaria por un modelo mas viejo.');
INSERT INTO comentarios
VALUES (DEFAULT, ('2021-02-11'), 8, 19, 'No se para que veo si no tengo plata');
INSERT INTO comentarios
VALUES (DEFAULT, ('2021-03-01'), 9, 19, 'Lo quiero');















