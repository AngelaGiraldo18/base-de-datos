CREATE TABLE Cliente (
  id_cli VARCHAR(11) PRIMARY KEY,
  nom_cli VARCHAR(30),
  ape_cli VARCHAR(30),
  dir_cli VARCHAR(100),
  dep_cli VARCHAR(20),
  mes_cum_cli VARCHAR(10)
);

CREATE OR REPLACE FUNCTION ClientesCumpleaniosEnMes(mes_buscado VARCHAR(10)) RETURNS TABLE (
    id_cli VARCHAR(11),
    nom_cli VARCHAR(30),
    ape_cli VARCHAR(30),
    dir_cli VARCHAR(100),
    dep_cli VARCHAR(20),
    mes_cum_cli VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM Cliente
    WHERE Cliente.mes_cum_cli = mes_buscado;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ClientesCumpleaniosEnMes('Enero');

CREATE OR REPLACE PROCEDURE InsertarCliente(
    IN idCliente VARCHAR(11),
    IN nombreCliente VARCHAR(30),
    IN apellidoCliente VARCHAR(30),
    IN direccionCliente VARCHAR(100),
    IN departamentoCliente VARCHAR(20),
    IN mesCumpleañosCliente VARCHAR(10)
) AS $$
BEGIN
    INSERT INTO Cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
    VALUES (idCliente, nombreCliente, apellidoCliente, direccionCliente, departamentoCliente, mesCumpleañosCliente);
END;
$$ LANGUAGE plpgsql;
CALL InsertarCliente('12345678901', 'John', 'Doe', '123 Main St', 'California', 'January');

CREATE OR REPLACE PROCEDURE EditarCliente(
    IN idCliente VARCHAR(11),
    IN nuevoNombreCliente VARCHAR(30),
    IN nuevoApellidoCliente VARCHAR(30),
    IN nuevaDireccionCliente VARCHAR(100),
    IN nuevoDepartamentoCliente VARCHAR(20),
    IN nuevoMesCumpleañosCliente VARCHAR(10)
) AS $$
BEGIN
    UPDATE Cliente
    SET nom_cli = nuevoNombreCliente, ape_cli = nuevoApellidoCliente,
        dir_cli = nuevaDireccionCliente, dep_cli = nuevoDepartamentoCliente,
        mes_cum_cli = nuevoMesCumpleañosCliente
    WHERE id_cli = idCliente;
END;
$$ LANGUAGE plpgsql;
CALL EditarCliente('12345678901', 'John', 'Doe', '456 Elm St', 'New York', 'February');



CREATE OR REPLACE PROCEDURE EliminarCliente(
    IN idCliente VARCHAR(11)
) AS $$
BEGIN
    DELETE FROM Cliente
    WHERE id_cli = idCliente;
END;
$$ LANGUAGE plpgsql;
CALL EliminarCliente('12345678901');

INSERT INTO Cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) VALUES
('51578901234', 'Francisco', 'Pérez', 'Calle 123, Ciudad UU', 'Departamento UU', 'Noviembre'),
('62689012345', 'Verónica', 'Gómez', 'Avenida X, Ciudad VV', 'Departamento VV', 'Diciembre'),
('73790123456', 'Samuel', 'Fernández', 'Calle 456, Ciudad WW', 'Departamento WW', 'Enero'),
('84801234567', 'Monica', 'Díaz', 'Avenida Z, Ciudad XX', 'Departamento XX', 'Febrero'),
('95912345678', 'Pedro', 'Jiménez', 'Calle 789, Ciudad YY', 'Departamento YY', 'Marzo'),
('101023456789', 'Gabriela', 'Vargas', 'Avenida Y, Ciudad ZZ', 'Departamento ZZ', 'Abril'),
('111134567890', 'Roberto', 'Morales', 'Calle 123, Ciudad AAA', 'Departamento AAA', 'Mayo'),
('121245678901', 'María', 'Campos', 'Avenida X, Ciudad BBB', 'Departamento BBB', 'Junio'),
('131356789012', 'Miguel', 'González', 'Calle 456, Ciudad CCC', 'Departamento CCC', 'Julio'),
('141467890123', 'Cristina', 'Martínez', 'Avenida Z, Ciudad DDD', 'Departamento DDD', 'Agosto'),
('151578901234', 'Andrés', 'Pérez', 'Calle 123, Ciudad EEE', 'Departamento EEE', 'Septiembre'),
('161689012345', 'Isabella', 'Ramírez', 'Avenida X, Ciudad FFF', 'Departamento FFF', 'Octubre'),
('171790123456', 'Joaquín', 'López', 'Calle 789, Ciudad GGG', 'Departamento GGG', 'Noviembre'),
('181801234567', 'Sofía', 'Hernández', 'Avenida Y, Ciudad HHH', 'Departamento HHH', 'Diciembre'),
('191812345678', 'Carlos', 'Torres', 'Calle 123, Ciudad III', 'Departamento III', 'Enero'),
('201823456789', 'Lorena', 'Sánchez', 'Avenida Z, Ciudad JJJ', 'Departamento JJJ', 'Febrero'),
('211834567890', 'Diego', 'Gómez', 'Calle 456, Ciudad KKK', 'Departamento KKK', 'Marzo'),
('221845678901', 'Natalia', 'Fernández', 'Avenida X, Ciudad LLL', 'Departamento LLL', 'Abril'),
('231856789012', 'Alejandro', 'Díaz', 'Calle 123, Ciudad MMM', 'Departamento MMM', 'Mayo'),
('241867890123', 'Mariana', 'Jiménez', 'Avenida Y, Ciudad NNN', 'Departamento NNN', 'Junio'),
('251878901234', 'José', 'Vargas', 'Calle 789, Ciudad OOO', 'Departamento OOO', 'Julio'),
('261889012345', 'Renata', 'Morales', 'Avenida Z, Ciudad PPP', 'Departamento PPP', 'Agosto'),
('271890123456', 'Andrea', 'Campos', 'Calle 123, Ciudad QQQ', 'Departamento QQQ', 'Septiembre'),
('281901234567', 'Roberto', 'González', 'Avenida X, Ciudad RRR', 'Departamento RRR', 'Octubre'),
('291912345678', 'Lucía', 'Martínez', 'Calle 456, Ciudad SSS', 'Departamento SSS', 'Noviembre'),
('301923456789', 'Felipe', 'Pérez', 'Avenida Y, Ciudad TTT', 'Departamento TTT', 'Diciembre'),
('311934567890', 'Camila', 'Ramírez', 'Calle 123, Ciudad UUU', 'Departamento UUU', 'Enero'),
('321945678901', 'Iván', 'López', 'Avenida Z, Ciudad VVV', 'Departamento VVV', 'Febrero'),
('331956789012', 'Laura', 'Hernández', 'Calle 789, Ciudad WWW', 'Departamento WWW', 'Marzo'),
('341967890123', 'Héctor', 'Torres', 'Avenida X, Ciudad XXX', 'Departamento XXX', 'Abril'),
('351978901234', 'Sara', 'Sánchez', 'Calle 123, Ciudad YYY', 'Departamento YYY', 'Mayo'),
('361989012345', 'David', 'Gómez', 'Avenida Y, Ciudad ZZZ', 'Departamento ZZZ', 'Junio'),
('372000123456', 'Valeria', 'Fernández', 'Calle 456, Ciudad AAAA', 'Departamento AAAA', 'Julio'),
('382011234567', 'Jorge', 'Díaz', 'Avenida Z, Ciudad BBBB', 'Departamento BBBB', 'Agosto'),
('392022345678', 'Marta', 'Jiménez', 'Calle 123, Ciudad CCCC', 'Departamento CCCC', 'Septiembre'),
('402033456789', 'Eduardo', 'Vargas', 'Avenida X, Ciudad DDDD', 'Departamento DDDD', 'Octubre'),
('412044567890', 'Luis', 'Morales', 'Calle 456, Ciudad EEEE', 'Departamento EEEE', 'Noviembre'),
('422055678901', 'Marcela', 'Campos', 'Avenida Y, Ciudad FFFF', 'Departamento FFFF', 'Diciembre'),
('432066789012', 'Javier', 'González', 'Calle 789, Ciudad GGGG', 'Departamento GGGG', 'Enero'),
('442077890123', 'Carmen', 'Martínez', 'Avenida Z, Ciudad HHHH', 'Departamento HHHH', 'Febrero'),
('452088901234', 'Manuel', 'Pérez', 'Calle 123, Ciudad IIII', 'Departamento IIII', 'Marzo'),
('462099012345', 'Renata', 'Ramírez', 'Avenida X, Ciudad JJJJ', 'Departamento JJJJ', 'Abril'),
('472100123456', 'Gustavo', 'López', 'Calle 456, Ciudad KKKK', 'Departamento KKKK', 'Mayo'),
('482111234567', 'Luisa', 'Hernández', 'Avenida Y, Ciudad LLLL', 'Departamento LLLL', 'Junio'),
('492122345678', 'Sofía', 'Torres', 'Calle 123, Ciudad MMMM', 'Departamento MMMM', 'Julio'),
('502133456789', 'Joaquín', 'Sánchez', 'Avenida Z, Ciudad NNNN', 'Departamento NNNN', 'Agosto'),
('512144567890', 'Ivanna', 'Gómez', 'Calle 789, Ciudad OOOO', 'Departamento OOOO', 'Septiembre'),
('522155678901', 'Diego', 'Fernández', 'Avenida X, Ciudad PPPP', 'Departamento PPPP', 'Octubre'),
('532166789012', 'Valentina', 'Díaz', 'Calle 123, Ciudad QQQQ', 'Departamento QQQQ', 'Noviembre'),
('542177890123', 'Andrés', 'Jiménez', 'Avenida Y, Ciudad RRRR', 'Departamento RRRR', 'Diciembre'),
('552188901234', 'Natalia', 'Vargas', 'Calle 456, Ciudad SSSS', 'Departamento SSSS', 'Enero'),
('562199012345', 'Elena', 'Morales', 'Avenida Z, Ciudad TTTT', 'Departamento TTTT', 'Febrero'),
('572200123456', 'José', 'Campos', 'Calle 789, Ciudad UUUU', 'Departamento UUUU', 'Marzo'),
('582211234567', 'Cristina', 'González', 'Avenida X, Ciudad VVVV', 'Departamento VVVV', 'Abril');



CREATE TABLE Artículo (
  id_art SERIAL PRIMARY KEY,
  tit_art VARCHAR(100),
  aut_art VARCHAR(100),
  edi_art VARCHAR(300),
  prec_art INT
);

INSERT INTO Artículo (tit_art, aut_art, edi_art, prec_art) VALUES
('Programación en Java', 'Andrés Mendoza', 'Editorial Z', 42),
('Historia de la Literatura Universal', 'Isabel Torres', 'Editorial A', 28),
('Física Cuántica', 'Héctor Jiménez', 'Editorial B', 34),
('Diseño de Logos', 'Renata Sánchez', 'Editorial C', 48),
('Inglés Intermedio', 'Diego Martínez', 'Editorial D', 32),
('Economía de Mercado', 'Sofía Pérez', 'Editorial E', 30),
('Cálculo Avanzado', 'Mariana González', 'Editorial F', 38),
('Historia de la Música', 'Roberto Ramírez', 'Editorial G', 31),
('Arte Contemporáneo', 'Joaquín Vargas', 'Editorial H', 46),
('Química Inorgánica', 'Elena Ortega', 'Editorial I', 39),
('Literatura Romántica', 'Luis Silva', 'Editorial J', 27),
('Geología', 'Carmen Morales', 'Editorial K', 33),
('Dibujo Técnico', 'Pedro López', 'Editorial L', 35),
('Estadística Avanzada', 'Lorena Soto', 'Editorial M', 40),
('Inglés para Viajeros', 'Andrea Pérez', 'Editorial N', 22),
('Álgebra Lineal Avanzada', 'David Vélez', 'Editorial O', 37),
('Historia de la Filosofía', 'Sara Gómez', 'Editorial P', 30),
('Anatomía Comparada', 'Javier Ramírez', 'Editorial Q', 41),
('Diseño de Páginas Web', 'Valentina Torres', 'Editorial R', 44),
('Economía Empresarial', 'Gabriel Peralta', 'Editorial S', 29),
('Inglés para Profesionales', 'Renata Rojas', 'Editorial T', 33),
('Cálculo Multivariable', 'Cecilia Duarte', 'Editorial U', 36),
('Historia Medieval', 'Fernando Góngora', 'Editorial V', 30),
('Programación en JavaScript', 'María González', 'Editorial W', 43),
('Psicología Clínica', 'Miguel Estrada', 'Editorial X', 35),
('Genética Molecular', 'Gustavo Aguirre', 'Editorial Y', 42),
('Fotografía de Paisajes', 'Verónica Villa', 'Editorial Z', 47),
('Contabilidad de Costos', 'Manuel Roldán', 'Editorial AA', 30),
('Inglés para Estudiantes', 'Luisa Vélez', 'Editorial BB', 32),
('Álgebra Lineal Aplicada', 'Carlos Franco', 'Editorial CC', 36),
('Historia del Arte Moderno', 'Andrés Peña', 'Editorial DD', 29),
('Desarrollo de Videojuegos', 'Ana Arias', 'Editorial EE', 48),
('Marketing Digital', 'Carmen Cortés', 'Editorial FF', 43),
('Inglés para Viajes de Negocios', 'Elena Vélez', 'Editorial GG', 31),
('Geometría Avanzada', 'Roberto Lara', 'Editorial HH', 34),
('Historia del Deporte Olímpico', 'Joaquín Soto', 'Editorial II', 37),
('Inteligencia Artificial Avanzada', 'Sofía Jiménez', 'Editorial JJ', 45),
('Sociología Urbana', 'Diego Salazar', 'Editorial KK', 40),
('Ecología del Ecosistema', 'Natalia Estrada', 'Editorial LL', 42),
('Arte Digital Avanzado', 'Federico Londoño', 'Editorial MM', 55),
('Marketing Estratégico', 'Valeria Peña', 'Editorial NN', 34),
('Inglés para Viajes Internacionales', 'Gustavo Orozco', 'Editorial OO', 39),
('Geometría Fractal', 'Mariana Mendoza', 'Editorial PP', 27),
('Historia de la Arquitectura', 'Manuel Duarte', 'Editorial QQ', 36),
('Desarrollo de Aplicaciones Empresariales', 'Luisa Jiménez', 'Editorial RR', 47),
('Teoría Literaria', 'Carlos Salazar', 'Editorial SS', 38),
('Ecología Marina', 'Ana Estrada', 'Editorial TT', 45),
('Arte Digital para Ilustradores', 'Adriana Luna', 'Editorial UU', 41),
('Marketing de Contenidos', 'Fernando Arias', 'Editorial VV', 43),
('Inglés para Viajes de Placer', 'Mónica Cortés', 'Editorial WW', 32),
('Geometría Descriptiva', 'Alejandro Góngora', 'Editorial XX', 35),
('Historia de la Arqueología', 'Valeria Villa', 'Editorial YY', 37),
('Desarrollo de Aplicaciones Web', 'Roberto Valencia', 'Editorial ZZ', 46);

CREATE TABLE Pedido (
  id_ped SERIAL PRIMARY KEY,
  id_cli_ped VARCHAR(11),
  fec_ped DATE,
  val_ped INT,
  FOREIGN KEY (id_cli_ped) REFERENCES Cliente(id_cli)
);


DROP FUNCTION IF EXISTS visualizarpedidosporarticulo(integer);
CREATE OR REPLACE FUNCTION visualizarpedidosporarticulo(id_articulo INT)
RETURNS TABLE (
    nom_cli VARCHAR(30),
    dir_cli VARCHAR(100),
    id_ped INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT C.nom_cli, C.dir_cli, P.id_ped
    FROM Pedido P
    INNER JOIN Cliente C ON P.id_cli_ped = C.id_cli
    WHERE P.id_ped = id_articulo;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM visualizarpedidosporarticulo(1);

CREATE OR REPLACE FUNCTION ObtenerInformacionCliente(
    IN cliente_id VARCHAR(11)
) RETURNS TABLE (
    nombre_cliente VARCHAR(30),
    fecha DATE,
    valor INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nom_cli, p.fec_ped, p.val_ped
    FROM Cliente c
    INNER JOIN Pedido p ON c.id_cli = p.id_cli_ped
    WHERE c.id_cli = cliente_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ObtenerInformacionCliente('datos');


select * from pedido

INSERT INTO Pedido (id_cli_ped, fec_ped, val_ped) VALUES
('51567890123', '2024-04-25', 190),
('62678901234', '2024-05-01', 235),
('73789012345', '2024-05-06', 215),
('84890123456', '2024-05-11', 250),
('95901234567', '2024-05-16', 205),
('10112345678', '2024-05-21', 240),
('11123456789', '2024-05-26', 255),
('12134567890', '2024-06-01', 230),
('13145678901', '2024-06-06', 275),
('14156789012', '2024-06-11', 230),
('15167890123', '2024-06-16', 220),
('16178901234', '2024-06-21', 265),
('17189012345', '2024-06-26', 270),
('18190123456', '2024-07-01', 195),
('19201234567', '2024-07-06', 225),
('20212345678', '2024-07-11', 250),
('21223456789', '2024-07-16', 210),
('22234567890', '2024-07-21', 245),
('23245678901', '2024-07-26', 220),
('24256789012', '2024-08-01', 260),
('25267890123', '2024-08-06', 230),
('26278901234', '2024-08-11', 265),
('27289012345', '2024-08-16', 240),
('28290123456', '2024-08-21', 280),
('29301234567', '2024-08-26', 220),
('30312345678', '2024-09-01', 250),
('31323456789', '2024-09-06', 215),
('32334567890', '2024-09-11', 240),
('33345678901', '2024-09-16', 235),
('34356789012', '2024-09-21', 270),
('35367890123', '2024-09-26', 225),
('36378901234', '2024-09-30', 240),
('37389012345', '2024-10-05', 230),
('38390123456', '2024-10-10', 270),
('39401234567', '2024-10-15', 245),
('40412345678', '2024-10-20', 260),
('41423456789', '2024-10-25', 250),
('42434567890', '2024-10-30', 225),
('43445678901', '2024-11-05', 230),
('44456789012', '2024-11-10', 265),
('45467890123', '2024-11-15', 240),
('46478901234', '2024-11-20', 275),
('47489012345', '2024-11-25', 230),
('48490123456', '2024-11-30', 255),
('49401234567', '2024-12-05', 240),
('50412345678', '2024-12-10', 260),
('51423456789', '2024-12-15', 250),
('52434567890', '2024-12-20', 230),
('53445678901', '2024-12-25', 270),
('54456789012', '2024-12-30', 245);

CREATE TABLE Artículoxpedido (
  id_ped_artped INT,
  id_art_artped INT,
  can_art_artped INT,
  val_ven_art_artped INT,
  FOREIGN KEY (id_ped_artped) REFERENCES Pedido(id_ped),
  FOREIGN KEY (id_art_artped) REFERENCES Artículo(id_art)
);

INSERT INTO Artículoxpedido (id_ped_artped, id_art_artped, can_art_artped, val_ven_art_artped) VALUES
(47, 47, 1, 55),
(48, 48, 4, 90),
(49, 49, 2, 65),
(50, 50, 3, 80),
(51, 51, 1, 45),
(52, 52, 5, 100),
(53, 53, 2, 70),
(54, 54, 3, 85),
(55, 55, 1, 45),
(56, 56, 4, 95),
(57, 57, 2, 60),
(58, 58, 3, 75),
(59, 59, 1, 50),
(60, 60, 5, 110),
(61, 61, 2, 70),
(62, 62, 3, 85),
(63, 63, 1, 45),
(64, 64, 4, 95),
(65, 65, 2, 60),
(66, 66, 3, 75),
(67, 67, 1, 50),
(68, 68, 5, 115),
(69, 69, 2, 70),
(70, 70, 3, 90),
(71, 71, 1, 55),
(72, 72, 4, 100),
(73, 73, 2, 60),
(74, 74, 3, 75),
(75, 75, 1, 45),
(76, 76, 5, 105),
(77, 77, 2, 70),
(78, 78, 3, 90),
(79, 79, 1, 55),
(80, 80, 4, 100),
(81, 81, 2, 60),
(82, 82, 3, 75),
(83, 83, 1, 45),
(84, 84, 5, 105),
(85, 85, 2, 70),
(86, 86, 3, 90),
(87, 87, 1, 55),
(88, 88, 4, 100),
(89, 89, 2, 60),
(90, 90, 3, 75),
(91, 91, 1, 50),
(92, 92, 5, 110),
(93, 93, 2, 70),
(94, 94, 3, 85),
(95, 95, 1, 45);

 CREATE TABLE Compañia (
  comnit VARCHAR(11) PRIMARY KEY,
  comnombre VARCHAR(30),
  comañofun INT,
  comreplegal VARCHAR(100)
);

CREATE OR REPLACE FUNCTION EmpresasFundadasPorAño(
    IN año_fundacion INT
) RETURNS TABLE (
    nit VARCHAR(11),
    nombre VARCHAR(30),
    anio_fundacion INT,
    representante_legal VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT comnit, comnombre, comañofun, comreplegal
    FROM Compañia
    WHERE comañofun = año_fundacion;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM EmpresasFundadasPorAño(2000);

CREATE OR REPLACE FUNCTION VisualizarEmpresaPorNIT(
    IN nit_empresa VARCHAR(11)
) RETURNS TABLE (
    nit VARCHAR(11),
    nombre VARCHAR(30),
    año_fundacion INT,
    representante_legal VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT comnit, comnombre, comañofun, comreplegal
    FROM Compañia
    WHERE comnit = nit_empresa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM VisualizarEmpresaPorNIT('dato nit');

CREATE OR REPLACE PROCEDURE InsertarCompañia(
	IN comnit VARCHAR(11),
	IN comNombre VARCHAR(30),
	IN comAñofun INT,
	IN comReplegal varchar(100)
)AS $$
BEGIN
INSERT INTO Compañia (comnit, comnombre, comañofun, comreplegal) 
VALUES (comnit,comNombre,comAñofun,comReplegal);
END;
$$ LANGUAGE plpgsql;
CALL InsertarCompañia('123441','compañiaWww',2005,'angela maria');

DROP PROCEDURE EditarCompañia(character varying, character varying, integer, character varying);
CREATE OR REPLACE PROCEDURE EditarCompañia(
    IN new_comnit VARCHAR(11),
    IN new_comNombre VARCHAR(30),
    IN new_comAñofun INT,
    IN new_comReplegal VARCHAR(100)
) AS $$
BEGIN 
    UPDATE Compañia AS c
    SET comnombre = new_comNombre, comañofun = new_comAñofun, comreplegal = new_comReplegal
    WHERE comnit = new_comnit;
END;
$$ LANGUAGE plpgsql;


CALL EditarCompañia('dato a editar', 'dato a editar', 2020, 'dato editar');

CREATE OR REPLACE PROCEDURE EliminarCompañia(
	IN Eli_comnit VARCHAR(11)
)AS $$
BEGIN
DELETE FROM Compañia
WHERE comnit = Eli_comnit;
END;
$$ LANGUAGE plpgsql;

select * from Compañia
INSERT INTO Compañia (comnit, comnombre, comañofun, comreplegal) VALUES
('51123456789', 'Compañía UU', 2020, 'Luis Pérez'),
('52234567890', 'Compañía VV', 2021, 'Ana Rodríguez'),
('53345678901', 'Compañía WW', 2022, 'Carlos Martínez'),
('54456789012', 'Compañía XX', 2023, 'María Torres'),
('55567890123', 'Compañía YY', 2024, 'Pedro López'),
('56678901234', 'Compañía ZZ', 2025, 'Sofía Rodríguez'),
('57789012345', 'Compañía AAA', 2026, 'Javier Martínez'),
('58890123456', 'Compañía BBB', 2027, 'Lorena López'),
('59901234567', 'Compañía CCC', 2028, 'David Torres'),
('61012345678', 'Compañía DDD', 2029, 'Laura Rodríguez'),
('62123456789', 'Compañía EEE', 2030, 'Miguel Pérez'),
('63234567890', 'Compañía FFF', 2031, 'Isabel Martínez'),
('64345678901', 'Compañía GGG', 2032, 'Jorge Torres'),
('65456789012', 'Compañía HHH', 2033, 'Carmen López'),
('66567890123', 'Compañía III', 2034, 'Luis Rodríguez'),
('67678901234', 'Compañía JJJ', 2035, 'Ricardo Pérez'),
('68789012345', 'Compañía KKK', 2036, 'María Martínez'),
('69890123456', 'Compañía LLL', 2037, 'Diego Torres'),
('70901234567', 'Compañía MMM', 2038, 'Valeria Rodríguez'),
('71012345678', 'Compañía NNN', 2039, 'Natalia Pérez'),
('72123456789', 'Compañía OOO', 2040, 'Eduardo Martínez'),
('73234567890', 'Compañía PPP', 2041, 'Adriana Torres'),
('74345678901', 'Compañía QQQ', 2042, 'Gabriel López'),
('75456789012', 'Compañía RRR', 2043, 'Renata Rodríguez'),
('76567890123', 'Compañía SSS', 2044, 'Roberto Pérez'),
('77678901234', 'Compañía TTT', 2045, 'Manuel Martínez'),
('78789012345', 'Compañía UUU', 2046, 'Lucía Torres'),
('79890123456', 'Compañía VVV', 2047, 'Felipe López'),
('80901234567', 'Compañía WWW', 2048, 'Camila Rodríguez'),
('81012345678', 'Compañía XXX', 2049, 'Alejandro Pérez'),
('82123456789', 'Compañía YYY', 2050, 'Diana Martínez'),
('83234567890', 'Compañía ZZZ', 2051, 'Isabella Torres'),
('84345678901', 'Compañía AAAA', 2052, 'Gustavo López'),
('85456789012', 'Compañía BBBB', 2053, 'Renata Rodríguez'),
('86567890123', 'Compañía CCCC', 2054, 'Sara Pérez'),
('87678901234', 'Compañía DDDD', 2055, 'Carlos Martínez'),
('88789012345', 'Compañía EEEE', 2056, 'Carlos Torres'),
('89890123456', 'Compañía FFFF', 2057, 'María Martínez'),
('90101234567', 'Compañía GGGG', 2058, 'Laura Gómez'),
('91212345678', 'Compañía HHHH', 2059, 'Sofía Pérez'),
('92323456789', 'Compañía IIII', 2060, 'Pedro Rodríguez'),
('93434567890', 'Compañía JJJJ', 2061, 'Luis López'),
('94545678901', 'Compañía KKKK', 2062, 'Carmen Torres'),
('95656789012', 'Compañía LLLL', 2063, 'Carlos Ramírez'),
('96767890123', 'Compañía MMMM', 2064, 'Ana Martínez'),
('97878901234', 'Compañía NNNN', 2065, 'María Rodríguez');



