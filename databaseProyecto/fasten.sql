DROP database if exists fasten;
CREATE database fasten;
USE fasten;

CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha DATE,
mail VARCHAR(200) NOT NULL,
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

FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE -- porque es un uno a muchos
);

CREATE TABLE comentarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
fecha_creacion DATE,
id_usuario INT UNSIGNED,
id_producto INT UNSIGNED,
mail VARCHAR(200) NOT NULL,
foto VARCHAR(200) NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE,
FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE CASCADE
);

INSERT INTO usuarios VALUES (DEFAULT,('2021-01-29'),'diego33@gmail.com','Diego33','hola123','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2002-03-03'),'Franco@gmail.com','FRancoSantoro','hola123','foto-1624397935446.jpeg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2001-09-09'),'Anamaria@gmail.com','AnamariaMarcela','hola123','foto-1624471901658.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1998-04-23'),'Seba@gmail.com','Sebastian56','hola123','foto-1624733873469.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1978-11-17'),'Marcel@gmail.com','MarceloJorge123','hola123','DSC_0059.JPG', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2005-11-14'),'GretaPLanta@gmail.com','Greta Thumberg','hola123','DSC_0152.JPG', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2001-02-02'),'JUan45@gmail.com','Juan Sanchez','hola123','gretaThunberg.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2000-12-12'),'Silvina22@gmail.com','Silvina Zampedri','hola123','luli.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('2018-12-09'),'Oso08@gmail.com','Lucas Pratto','hola123','martu.jpg', DEFAULT, DEFAULT);
INSERT INTO usuarios VALUES (DEFAULT,('1976-09-11'),'juanajason@gmail.com','Juana Jason','hola123','pedroperez.jpg', DEFAULT, DEFAULT);

INSERT INTO productos VALUES (DEFAULT,'A3SEDAN1.jpg','Audi A3 Sed??n',('2021-01-29'),1,'El Audi A3 es un autom??vil del segmento C producido por el fabricante alem??n Audi desde 1996, abarcando 4 generaciones hasta el momento. Desde finales de verano de 2013 se ofrece tambi??n un A3 con carrocer??a sed??n (o Limousine)???. Tiene 4.46 metros de largo, es decir casi 25 cm menos largo que un A4???.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'840_560.jpg','Audi S3',('2021-01-21'),2,'El motor 2.0 TFSI tiene una potencia de 310 CV y 400 Nm de par. De esta forma, el nuevo Audi S3 acelera de 0 a 100 km/h en solo 4,6 segundos y alcanza la velocidad m??xima de 250 km/h. El Nuevo Audi S3 Sportback est?? equipado con una transmisi??n S tronic de siete velocidades.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'audi_a3.jpg ','Audi A3 Sportback',('2021-01-12'),3,'El Audi A3 es el compacto de la marca de los cuatro aros desde 1996, a??o en el que fue presentada la primera de sus ediciones. Es el precursor del segmento C premium, segmento que a d??a de hoy comparte con sus m??ximos rivales, tambi??n de origen alem??n. A principios de 2020 se ha presentado la ??ltima de sus generaciones, la cuarta, con importantes cambios en todos los niveles.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'r8.jpg','Audi R8 V8',('2021-01-30'),4,'El Audi R8 se comercializa con un ??nico propulsor, un V10 atmosf??rico de 5,2 litros, con lubricaci??n por c??rter seco e inyecci??n directa. Se ofrece en dos versiones de potencia, 570 CV y 620 CV. Esta ??ltima versi??n corresponde al Audi R8 V10 Performance quattro, el modelo m??s potente de la gama R8.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'bmw-x6.jpg','BMW X6',('2021-01-12'),5,'El X6 es un modelo con est??tica de todocamino coup?? pero enfocado a un uso por asfalto. Comparte un gran n??mero de elementos mec??nicos y estructurales con el BMW X5. La actual generaci??n, la tercera, sali?? al mercado a principios de 2020 y cuenta con unas medidas de 4,94 metros de largo, 2 metros de ancho y 1,70 de alto. Su maletero cubica 580 litros. Todas las versiones a la venta cuentan con tracci??n integral xDrive de serie.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'208.png','Peugeot',('2021-01-11'),6,'Veh??culo din??mico y bien equilibrado. Equipado para hacer de tu viaje toda una experiencia: posee el nuevo i_Cockpit, caja autom??tica de seis velocidades, dispositivo all-in-one con pantalla t??ctil, techo de cielo panor??mico. Adem??s, incorpora tecnolog??as de punta para mejorar su rendimiento, usabilidad y seguridad, como adaptaci??n autom??tica al entorno luminoso, mantenimiento l??nea de carril y alerta de descanso.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'corolla.jpg','Toyota Corolla',('2021-01-03'),7,'En esta generaci??n 2020, ofrece muchas mejoras destacables: un dise??o atractivo, un motor m??s potente (aunque tambi??n m??s eficiente), una nueva caja no-tan-CVT, un confort de marcha muy superior y un equipamiento de seguridad ejemplar (aunque s??lo en las versiones SEG).', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'giulia.jpg','Alfa Romeo Giulia',('2021-01-02'),8,'Motor V6 de origen Ferrari. Un propulsor que con un sistema biturbo desarrolla la tremenda potencia de 510 CV. Este propulsor le permite una aceleraci??n de 0 a 100 km/h de s??lo 3,9 segundos, y una velocidad m??xima posiblemente superior a los 300 km/h.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'mercedesa45.jpg','Mercedes Benz A45 Amg',('2021-01-09'),9,'El Mercedes-AMG A 45 S 4MATIC+ de 421 caballos es el Mercedes-Benz Clase A m??s potente y cuesta 74 000 euros. Su aspecto, si no se recurre a la lista de opciones, no dista mucho del que se puede conseguir en cualquier Clase A con el paquete decorativo opcional AMG Line. Sin embargo hay algo en su est??tica que delata que estamos ante un veh??culo muy especial. Quiz?? sea la parrilla y las entradas de aire inferiores, que tienen un dise??o exclusivo.', DEFAULT, DEFAULT);
INSERT INTO productos VALUES (DEFAULT,'mercedese63.jpg','Mercedes Benz E63 Amg',('2021-01-20'),10,'Motor naftero V8 4.0 biturbo, con 612 cv de potencia y 850 Nm de torque. Caja autom??tica de nueve velocidades y tracci??n integral 4Matic+, que incluye distribuci??n completa de torque (incluyendo tracci??n 100% trasera) y Drifting Mode (ver video abajo). Acelera de 0 a 100 km/h en 3,4 segundos y su velocidad m??xima est?? limitada a 250 km/h.', DEFAULT, DEFAULT);

INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Recomendable', 'dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-04'),1,1,'Esta bueno','foto-1624397935446.jpeg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-20'),1,1,'Prefiero esperar al nuevo modelo','foto-1624471901658.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,1,'Ya no lo recomiendo','foto-1624733873469.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-03'),1,2,'No es recomendable','pilargonzales.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-13'),3,2,'No me gusto','pedroperez.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-20'),5,2,'Es lindo','martu.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,2,'Me parece lento','luli.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),10,3,'Me parece rapido','gretaThunberg.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-14'),9,3,'Me parece rapido','foto-1624552694992.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.','foto-1624552485995.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),5,3,'Lo quiero cambiar.','foto-1624545635529.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-09'),7,4,'aMe arrepenti, alto dise??o','foto-1624296847283.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-10'),10,4,'Querria saber cuantos a??os de duracion tiene','foto-1624294509981.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-09'),1,4,'No me termina de convencer','foto-1624299601061.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-15'),7,4,'Buen color','DSC_0059.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-12'),10,5,'Parece del futuro','DSC_0152.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),1,5,'Esta para ponerlo al sopi','DSC_0084.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-10'),1,5,'Es horrible','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),2,5,'Quien me lo regala?','foto-1624397935446.jpeg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),4,6,'Me parece bastante lindo','foto-1624471901658.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,6,'Es electrico?','foto-1624733873469.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),5,6,'El auto de mis sue??os','pilargonzales.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-29'),1,6,'Parece carisimo. ','pedroperez.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-22'),2,7,'Prefiero un modelo mas viejo.','martu.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),8,7,'No me gusta.','luli.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),10,7,'El auto de mis sue??os.','gretaThunberg.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,7,'Es hermoso','foto-1624545635529.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,8,'Prefiero un modelo mas viejo.','foto-1624552694992.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,8,'No lo compro ni ahi','foto-1624552485995.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,8,'Auto feisimo','foto-1624294509981.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-23'),3,8,'Es hermoso','foto-1624299601061.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-22'),4,9,'Ojala alguien me lo regale.','DSC_0059.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-11'),8,9,'No se para que veo si no tengo plata','DSC_0152.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-01'),9,9,'El color que tiene lo hace ver hermoso','dopo.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-02'),3,9,'Viene con 8 velocidades?','foto-1624397935446.jpeg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-01-25'),4,10,'Lo cambiaria por un modelo mas viejo.','gretaThunberg.jpg', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-02-11'),8,10,'No se para que veo si no tengo plata','DSC_0084.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-03-01'),9,10,'Lo quiero','DSC_0084.JPG', DEFAULT, DEFAULT);
INSERT INTO comentarios VALUES (DEFAULT,('2021-04-11'),2,10,'Es electrico?','foto-1624299601061.JPG', DEFAULT, DEFAULT); -- DEFAULT, DEFAULT para que se cree el createdAt y updatedAt









