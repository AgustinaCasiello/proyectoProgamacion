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


INSERT INTO usuarios VALUES (DEFAULT,('2021-01-29'),'diego33@gmail.com',3,'Diego33');
INSERT INTO usuarios VALUES (DEFAULT,('2002-03-03'),'Franco@gmail.com',5,'FRancoSantoro');
INSERT INTO usuarios VALUES (DEFAULT,('2001-09-09'),'Anamaria@gmail.com',21,'AnamariaMarcela');
INSERT INTO usuarios VALUES (DEFAULT,('1998-04-23'),'Seba@gmail.com',0,'Sebastian56');
INSERT INTO usuarios VALUES (DEFAULT,('1978-11-17'),'Marcel@gmail.com',1,'MarceloJorge123');
INSERT INTO usuarios VALUES (DEFAULT,('2005-11-14'),'GretaPLanta@gmail.com',3,'Greta Thumberg');
INSERT INTO usuarios VALUES (DEFAULT,('2001-02-02'),'JUan45@gmail.com',22,'Juan Sanchez');
INSERT INTO usuarios VALUES (DEFAULT,('2000-12-12'),'Silvina22@gmail.com',1,'Silvina Zampedri');
INSERT INTO usuarios VALUES (DEFAULT,('2018-12-09'),'Oso08@gmail.com',4,'Lucas Pratto');
INSERT INTO usuarios VALUES (DEFAULT,('1976-09-11'),'juanajason@gmail.com',1,'Juana Jason');

INSERT INTO productos VALUES (DEFAULT,'/images/autos/A3SEDAN1.jpg','Audi A3 Sedán',('2021-01-29'),1);
INSERT INTO productos VALUES (DEFAULT,'images/autos/840_560.jpg','Audi S3',('2021-01-21'),2);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/audi_a3.jpg ','Audi A3 Sportback',('2021-01-12'),3);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/r8.jpg','Audi R8 V8',('2021-01-30'),4);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/bmw-x6.jpg','BMW X6',('2021-01-12'),5);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/208.png','Peugeot',('2021-01-11'),6);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/corolla.jpg','Toyota Corolla',('2021-01-03'),7);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/giulia.jpg','Alfa Romeo Giulia',('2021-01-02'),8);
INSERT INTO productos VALUES (DEFAULT,'https://i.blogs.es/b51f1c/mercedes-amg-a-45-4matic-2019-40-p/1366_2000.jpg','Mercedes Benz A45 Amg',('2021-01-09'),9);
INSERT INTO productos VALUES (DEFAULT,'https://automotiva.com.ar/wp-content/uploads/2018/05/Mercedes-Benz_E63_AMG-7.jpg','Mercedes Benz E63 Amg',('2021-01-20'),10);

INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Recomendable');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-04'),1,1,'Esta bueno');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Prefiero esperar al nuevo modelo');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,1,'Ya no lo recomiendo');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,2,'No es recomendable');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-13'),3,2,'No me gusto');
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-20'),5,2,'Es lindo');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,2,'Me parece lento');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,3,'Me parece rapido');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-14'),9,3,'Me parece rapido');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),7,4,'aMe arrepenti, alto diseño');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-10'),10,4,'Querria saber cuantos años de duracion tiene');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-09'),1,4,'No me termina de convencer');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-15'),7,4,'Buen color');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-12'),10,5,'Parece del futuro');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),1,5,'Esta para ponerlo al sopi');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-10'),1,5,'Es horrible');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),2,5,'Quien me lo regala?');
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),4,6,'Me parece bastante lindo');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,6,'Es electrico?');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),5,6,'El auto de mis sueños');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),1,6,'Parece carisimo. ');
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),2,7,'Prefiero un modelo mas viejo.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),8,7,'No me gusta.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),10,7,'El auto de mis sueños.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,7,'Es hermoso');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,8,'Prefiero un modelo mas viejo.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,8,'No lo compro ni ahi');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,8,'Auto feisimo');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,8,'Es hermoso');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,9,'Ojala alguien me lo regale.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,9,'No se para que veo si no tengo plata');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,9,'El color que tiene lo hace ver hermoso');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-02'),3,9,'Viene con 8 velocidades?');
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-25'),4,10,'Lo cambiaria por un modelo mas viejo.');
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-11'),8,10,'No se para que veo si no tengo plata');
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-01'),9,10,'Lo quiero');
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,10,'Es electrico?');





