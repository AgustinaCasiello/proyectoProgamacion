DROP database if exists fasten;
CREATE database fasten;
USE fasten;

CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE,
text VARCHAR(200) NOT NULL,
nombre VARCHAR(50) NOT NULL,
contrasena VARCHAR(200) NOT NULL,
foto VARCHAR(200) NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE productos (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
image_URL VARCHAR(250),
nombre VARCHAR(50) NOT NULL,
fecha_creacion DATE,
id_usuario INT UNSIGNED, 
descripcion VARCHAR(5000) NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id) -- porque es un uno a muchos
);


CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha_creacion DATE,
id_usuario INT UNSIGNED,
id_producto INT UNSIGNED,
text VARCHAR(200) NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO usuarios VALUES (DEFAULT,('2021-01-29'),'diego33@gmail.com','Diego33','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2002-03-03'),'Franco@gmail.com','FRancoSantoro','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2001-09-09'),'Anamaria@gmail.com','AnamariaMarcela','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1998-04-23'),'Seba@gmail.com','Sebastian56','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1978-11-17'),'Marcel@gmail.com','MarceloJorge123','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2005-11-14'),'GretaPLanta@gmail.com','Greta Thumberg','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2001-02-02'),'JUan45@gmail.com','Juan Sanchez','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2000-12-12'),'Silvina22@gmail.com','Silvina Zampedri','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2018-12-09'),'Oso08@gmail.com','Lucas Pratto','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1976-09-11'),'juanajason@gmail.com','Juana Jason','hola123','dopo.jpg', DEFAULT, DEFAULT);

INSERT INTO productos VALUES (DEFAULT,'/images/autos/A3SEDAN1.jpg','Audi A3 Sedán',('2021-01-29'),1,'El Audi A3 es un automóvil del segmento C producido por el fabricante alemán Audi desde 1996, abarcando 4 generaciones hasta el momento. Desde finales de verano de 2013 se ofrece también un A3 con carrocería sedán (o Limousine)​. Tiene 4.46 metros de largo, es decir casi 25 cm menos largo que un A4​.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'images/autos/840_560.jpg','Audi S3',('2021-01-21'),2,'El motor 2.0 TFSI tiene una potencia de 310 CV y 400 Nm de par. De esta forma, el nuevo Audi S3 acelera de 0 a 100 km/h en solo 4,6 segundos y alcanza la velocidad máxima de 250 km/h. El Nuevo Audi S3 Sportback está equipado con una transmisión S tronic de siete velocidades.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/audi_a3.jpg ','Audi A3 Sportback',('2021-01-12'),3,'El Audi A3 es el compacto de la marca de los cuatro aros desde 1996, año en el que fue presentada la primera de sus ediciones. Es el precursor del segmento C premium, segmento que a día de hoy comparte con sus máximos rivales, también de origen alemán. A principios de 2020 se ha presentado la última de sus generaciones, la cuarta, con importantes cambios en todos los niveles.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/r8.jpg','Audi R8 V8',('2021-01-30'),4,'El Audi R8 se comercializa con un único propulsor, un V10 atmosférico de 5,2 litros, con lubricación por cárter seco e inyección directa. Se ofrece en dos versiones de potencia, 570 CV y 620 CV. Esta última versión corresponde al Audi R8 V10 Performance quattro, el modelo más potente de la gama R8.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/bmw-x6.jpg','BMW X6',('2021-01-12'),5,'El X6 es un modelo con estética de todocamino coupé pero enfocado a un uso por asfalto. Comparte un gran número de elementos mecánicos y estructurales con el BMW X5. La actual generación, la tercera, salió al mercado a principios de 2020 y cuenta con unas medidas de 4,94 metros de largo, 2 metros de ancho y 1,70 de alto. Su maletero cubica 580 litros. Todas las versiones a la venta cuentan con tracción integral xDrive de serie.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/208.png','Peugeot',('2021-01-11'),6,'Vehículo dinámico y bien equilibrado. Equipado para hacer de tu viaje toda una experiencia: posee el nuevo i_Cockpit, caja automática de seis velocidades, dispositivo all-in-one con pantalla táctil, techo de cielo panorámico. Además, incorpora tecnologías de punta para mejorar su rendimiento, usabilidad y seguridad, como adaptación automática al entorno luminoso, mantenimiento línea de carril y alerta de descanso.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/corolla.jpg','Toyota Corolla',('2021-01-03'),7,'En esta generación 2020, ofrece muchas mejoras destacables: un diseño atractivo, un motor más potente (aunque también más eficiente), una nueva caja no-tan-CVT, un confort de marcha muy superior y un equipamiento de seguridad ejemplar (aunque sólo en las versiones SEG).', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'/images/autos/giulia.jpg','Alfa Romeo Giulia',('2021-01-02'),8,'Motor V6 de origen Ferrari. Un propulsor que con un sistema biturbo desarrolla la tremenda potencia de 510 CV. Este propulsor le permite una aceleración de 0 a 100 km/h de sólo 3,9 segundos, y una velocidad máxima posiblemente superior a los 300 km/h.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'https://i.blogs.es/b51f1c/mercedes-amg-a-45-4matic-2019-40-p/1366_2000.jpg','Mercedes Benz A45 Amg',('2021-01-09'),9,'El Mercedes-AMG A 45 S 4MATIC+ de 421 caballos es el Mercedes-Benz Clase A más potente y cuesta 74 000 euros. Su aspecto, si no se recurre a la lista de opciones, no dista mucho del que se puede conseguir en cualquier Clase A con el paquete decorativo opcional AMG Line. Sin embargo hay algo en su estética que delata que estamos ante un vehículo muy especial. Quizá sea la parrilla y las entradas de aire inferiores, que tienen un diseño exclusivo.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'https://automotiva.com.ar/wp-content/uploads/2018/05/Mercedes-Benz_E63_AMG-7.jpg','Mercedes Benz E63 Amg',('2021-01-20'),10,'Motor naftero V8 4.0 biturbo, con 612 cv de potencia y 850 Nm de torque. Caja automática de nueve velocidades y tracción integral 4Matic+, que incluye distribución completa de torque (incluyendo tracción 100% trasera) y Drifting Mode (ver video abajo). Acelera de 0 a 100 km/h en 3,4 segundos y su velocidad máxima está limitada a 250 km/h.', DEFAULT, DEFAULT);

INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Recomendable', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-04'),1,1,'Esta bueno', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Prefiero esperar al nuevo modelo', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,1,'Ya no lo recomiendo', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,2,'No es recomendable', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-13'),3,2,'No me gusto', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-20'),5,2,'Es lindo', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,2,'Me parece lento', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,3,'Me parece rapido', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-14'),9,3,'Me parece rapido', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),7,4,'aMe arrepenti, alto diseño', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-10'),10,4,'Querria saber cuantos años de duracion tiene', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-09'),1,4,'No me termina de convencer', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-15'),7,4,'Buen color', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-12'),10,5,'Parece del futuro', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),1,5,'Esta para ponerlo al sopi', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-10'),1,5,'Es horrible', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),2,5,'Quien me lo regala?', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),4,6,'Me parece bastante lindo', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,6,'Es electrico?', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),5,6,'El auto de mis sueños', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),1,6,'Parece carisimo. ', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),2,7,'Prefiero un modelo mas viejo.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),8,7,'No me gusta.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),10,7,'El auto de mis sueños.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,7,'Es hermoso', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,8,'Prefiero un modelo mas viejo.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,8,'No lo compro ni ahi', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,8,'Auto feisimo', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,8,'Es hermoso', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,9,'Ojala alguien me lo regale.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,9,'No se para que veo si no tengo plata', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,9,'El color que tiene lo hace ver hermoso', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-02'),3,9,'Viene con 8 velocidades?', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-25'),4,10,'Lo cambiaria por un modelo mas viejo.', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-11'),8,10,'No se para que veo si no tengo plata', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-01'),9,10,'Lo quiero', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,10,'Es electrico?', DEFAULT, DEFAULT); -- DEFAULT, DEFAULT para que se cree el createdAt y updatedAt









