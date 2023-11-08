CREATE TABLE Profesor (
  doc_prof VARCHAR(11) PRIMARY KEY,
  nom_prof VARCHAR(30),
  ape_prof VARCHAR(30),
  cate_prof INT,
  sal_prof INT
);
CREATE TABLE Curso (
  cod_curs SERIAL PRIMARY KEY,
  nom_curs VARCHAR(100),
  horas_cur INT,
  valor_cur INT
);

CREATE OR REPLACE PROCEDURE InsertarCurso(
    IN nombreCurso VARCHAR(100),
    IN horasCurso INT,
    IN valorCurso INT
) AS $$ 
BEGIN
    
    INSERT INTO Curso (nom_curs, horas_cur, valor_cur)
    VALUES (nombreCurso, horasCurso, valorCurso);
END;
$$ LANGUAGE plpgsql;
CALL InsertarCurso('Curso de ejemplo', 40, 5000);

CREATE OR REPLACE PROCEDURE EditarCurso(
    IN codigoCurso INT,
    IN nombreCurso VARCHAR(100),
    IN horasCurso INT,
    IN valorCurso INT
) AS $$
BEGIN
    UPDATE Curso
    SET nom_curs = nombreCurso, horas_cur = horasCurso, valor_cur = valorCurso
    WHERE cod_curs = codigoCurso;
END;
$$ LANGUAGE plpgsql;

CALL EditarCurso(1, 'Nuevo nombre de curso', 45, 5500);

CREATE OR REPLACE PROCEDURE EliminarCurso(
    IN codigoCurso INT
) AS $$
BEGIN
    DELETE FROM Curso
    WHERE cod_curs = codigoCurso;
END;
$$ LANGUAGE plpgsql;
CALL EliminarCurso(55);

select * from Curso



CREATE TABLE Estudiante (
  doc_est VARCHAR(11) PRIMARY KEY,
  nom_est VARCHAR(30),
  ape_est VARCHAR(30),
  edad_est INT
);
CREATE TABLE Estudiantexcurso (
  cod_cur_estcur INT,
  doc_est_estcur VARCHAR(11),
  fec_ini_estcur DATE,
  PRIMARY KEY (cod_cur_estcur, doc_est_estcur),
  FOREIGN KEY (cod_cur_estcur) REFERENCES Curso(cod_curs),
  FOREIGN KEY (doc_est_estcur) REFERENCES Estudiante(doc_est)
);

INSERT INTO Profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) VALUES
('51512345678', 'Rosa', 'Martínez', 2, 45000),
('61612345678', 'Joaquín', 'Gómez', 1, 37000),
('71712345678', 'Luz', 'Torres', 3, 55000),
('81812345678', 'Eduardo', 'Sánchez', 2, 46000),
('91912345678', 'Isabella', 'López', 1, 36000),
('10101234568', 'Lucas', 'Fernández', 4, 60000),
('11111234568', 'Julieta', 'Hernández', 3, 52000),
('12121234568', 'Alejandro', 'Ramírez', 2, 44000),
('13131234568', 'Gloria', 'Torres', 1, 38000),
('14141234568', 'Ricardo', 'Gómez', 3, 54000),
('15151234568', 'Olivia', 'Silva', 2, 45000),
('16161234568', 'Javier', 'Cabrera', 1, 38000),
('17171234568', 'Mariana', 'Rojas', 4, 62000),
('18181234568', 'Camilo', 'Valencia', 2, 45000),
('19191234568', 'Gabriela', 'Orozco', 1, 36000),
('20201234568', 'Santiago', 'Londoño', 5, 70000),
('21211234568', 'Mónica', 'Paz', 4, 61000),
('22221234568', 'Andrea', 'Soto', 3, 53000),
('23231234568', 'Gustavo', 'Mendoza', 2, 46000),
('24241234568', 'Cristina', 'Estrada', 1, 38000),
('25251234568', 'Felipe', 'Aguirre', 3, 54000),
('26261234568', 'Verónica', 'Jiménez', 2, 45000),
('27271234568', 'Felipe', 'Ramos', 1, 36000),
('28281234568', 'Fernando', 'Navarro', 4, 62000),
('29291234568', 'Andrés', 'Peralta', 2, 45000),
('30301234568', 'Lorenzo', 'Campos', 1, 37000),
('31311234568', 'Cristina', 'Mora', 5, 70000),
('32321234568', 'Eduardo', 'Luna', 4, 61000),
('33331234568', 'Adriana', 'Arias', 3, 53000),
('34341234568', 'Fernando', 'Cortés', 2, 46000),
('35351234568', 'Mónica', 'Góngora', 1, 38000),
('36361234568', 'Alejandro', 'Villa', 3, 54000),
('37371234568', 'Valeria', 'Roldán', 2, 45000),
('38381234568', 'Gustavo', 'Peña', 1, 37000),
('39391234568', 'Mariana', 'Soto', 5, 70000),
('40401234568', 'Rafael', 'Duarte', 4, 61000),
('41411234568', 'Natalia', 'Zapata', 3, 53000),
('42421234568', 'Luis', 'Ramírez', 2, 46000),
('43431234568', 'Isabella', 'López', 1, 38000),
('44441234568', 'Lucas', 'Fernández', 3, 54000),
('45451234568', 'Julieta', 'Hernández', 2, 45000),
('46461234568', 'Alejandro', 'Ramírez', 1, 37000);

INSERT INTO Curso (nom_curs, horas_cur, valor_cur) VALUES
('Economía Internacional', 45, 400),
('Inglés para Negocios', 60, 550),
('Cálculo Integral', 70, 600),
('Historia del Cine', 45, 400),
('Programación en Python', 90, 750),
('Psicología', 60, 500),
('Genética', 75, 650),
('Fotografía Digital', 80, 700),
('Contabilidad Financiera', 45, 400),
('Inglés Técnico', 60, 550),
('Álgebra Abstracta', 70, 600),
('Historia Antigua', 45, 400),
('Desarrollo de Aplicaciones Móviles', 90, 750),
('Teatro y Dramaturgia', 60, 500),
('Microbiología', 75, 650),
('Arquitectura de Software', 80, 700),
('Marketing', 45, 400),
('Inglés Literario', 60, 550),
('Geometría', 70, 600),
('Historia del Deporte', 45, 400),
('Inteligencia Artificial', 90, 750),
('Sociología', 60, 500),
('Ecología', 75, 650),
('Arte Digital', 80, 700),
('Finanzas Personales', 45, 400),
('Inglés para Viajes', 60, 550),
('Álgebra Lineal Avanzada', 70, 600);

-- Insertar nuevos estudiantes en la tabla Estudiante para completar 50 registros
INSERT INTO Estudiante (doc_est, nom_est, ape_est, edad_est) VALUES
('50512345678', 'Natalia', 'Zapata', 22),
('60612345678', 'Germán', 'Ramírez', 23),
('70712345678', 'Valentina', 'López', 20),
('80812345678', 'Andrés', 'Hernández', 21),
('90912345678', 'Luis', 'Gómez', 22),
('10101234567', 'María', 'Pérez', 23),
('11111234567', 'Marta', 'Torres', 20),
('12121234567', 'Carlos', 'Sánchez', 21),
('13131234567', 'Sofía', 'Díaz', 22),
('14141234567', 'Lorena', 'Rodríguez', 23),
('15151234567', 'David', 'Martínez', 20),
('16161234567', 'Laura', 'González', 21),
('17171234567', 'Miguel', 'Ortega', 22),
('18181234567', 'Isabel', 'Rojas', 23),
('19191234567', 'Jorge', 'Lara', 20),
('20201234567', 'Carmen', 'Fernández', 21),
('21211234567', 'Luisa', 'Paz', 22),
('22221234567', 'Ricardo', 'Silva', 23),
('23231234567', 'María', 'Cabrera', 20),
('24241234567', 'Diego', 'Vargas', 21),
('25251234567', 'Valeria', 'Montoya', 22),
('26261234567', 'Andrés', 'Cortés', 23),
('27271234567', 'Natalia', 'Soto', 20),
('28281234567', 'Eduardo', 'Góngora', 21),
('29291234567', 'Adriana', 'Franco', 22),
('30301234567', 'Gustavo', 'Londoño', 23),
('31311234567', 'Mariana', 'Peña', 20),
('32321234567', 'Manuel', 'Soto', 21),
('33331234567', 'Luisa', 'Duarte', 22),
('34341234567', 'Carlos', 'Zapata', 23),
('35351234567', 'Ana', 'Ramírez', 20),
('36361234567', 'Rafael', 'Vélez', 21),
('37371234567', 'Roberto', 'Franco', 22),
('38381234567', 'Mariana', 'Pérez', 23),
('39391234567', 'Germán', 'Hernández', 20),
('40401234567', 'Valentina', 'Gómez', 21),
('41411234567', 'Andrés', 'Torres', 22),
('42421234567', 'Luis', 'Sánchez', 23),
('43431234567', 'Sofía', 'Díaz', 20),
('44441234567', 'Lorena', 'Rodríguez', 21),
('45451234567', 'David', 'Martínez', 22),
('46461234567', 'Laura', 'González', 23);
-- Insertar nuevos datos en la tabla Estudiantexcurso para completar 50 registros
INSERT INTO Estudiantexcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) VALUES
(4, '40044556677', '2023-09-01'),
(5, '50055667788', '2023-09-01'),
(6, '60066778899', '2023-09-01'),
(7, '70077889900', '2023-09-01'),
(8, '80088990011', '2023-09-01'),
(9, '90090001122', '2023-09-01'),
(10, '10100112233', '2023-09-01'),
(11, '11111223344', '2023-09-01'),
(12, '12122334455', '2023-09-01'),
(13, '13133445566', '2023-09-01'),
(14, '14144556677', '2023-09-01'),
(15, '15155667788', '2023-09-01'),
(16, '16166778899', '2023-09-01'),
(17, '17177889900', '2023-09-01'),
(18, '18188990011', '2023-09-01'),
(19, '19190001122', '2023-09-01'),
(20, '20200112233', '2023-09-01'),
(21, '21211223344', '2023-09-01'),
(22, '22222334455', '2023-09-01'),
(23, '23233445566', '2023-09-01'),
(24, '24244556677', '2023-09-01'),
(25, '25255667788', '2023-09-01'),
(26, '26266778899', '2023-09-01'),
(27, '27277889900', '2023-09-01'),
(28, '28288990011', '2023-09-01'),
(29, '29290001122', '2023-09-01'),
(30, '30300112233', '2023-09-01'),
(31, '31311223344', '2023-09-01'),
(32, '32322334455', '2023-09-01'),
(33, '33333445566', '2023-09-01'),
(34, '34344556677', '2023-09-01'),
(35, '35355667788', '2023-09-01'),
(36, '36366778899', '2023-09-01'),
(37, '37377889900', '2023-09-01'),
(38, '38388990011', '2023-09-01'),
(39, '39390001122', '2023-09-01'),
(40, '40400112233', '2023-09-01'),
(41, '41411223344', '2023-09-01'),
(42, '42422334455', '2023-09-01'),
(43, '43433445566', '2023-09-01'),
(44, '44444556677', '2023-09-01'),
(45, '45455667788', '2023-09-01'),
(46, '46466778899', '2023-09-01');
