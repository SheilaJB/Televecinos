SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema televecinosDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `televecinosDB` DEFAULT CHARACTER SET utf8 ;
USE `televecinosDB` ;

-- -----------------------------------------------------
-- Table `televecinosDB`.`Urbanizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Urbanizacion` (
  `idUrbanizacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUrbanizacion`))
ENGINE = InnoDB;

-- datos para Urbanizacion
INSERT INTO `televecinosDB`.`Urbanizacion` (`nombre`) VALUES
('Rafael Escardó'), 
('José de La Riva Agüero'), 
('Juan XXIII'), 
('Libertad'), 
('Los Jardines de La Marina'), 
('Las Leyendas'), 
('Las Torres San Miguelito'), 
('Elmer Faucett'), 
('Maranga'), 
('Pando'), 
('Parques de La Huaca'), 
('Otro');

-- -----------------------------------------------------
-- Table `televecinosDB`.`TipoCoordinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`TipoCoordinador` (
  `idTipoCoordinador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoCoordinador`))
ENGINE = InnoDB;

-- datos para tipo de coordinador
INSERT INTO `televecinosDB`.`TipoCoordinador` (`nombre`) VALUES
('Coordinadora de Cultura'), ('Coordinadora de Deportes');

-- -----------------------------------------------------
-- Table `televecinosDB`.`PreguntasFrecuentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`PreguntasFrecuentes` (
  `idtable2` INT NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(150) NOT NULL,
  `repuesta` VARCHAR(150) NOT NULL,
  `fechaModificacion` DATETIME(6) NOT NULL,
  PRIMARY KEY (`idtable2`))
ENGINE = InnoDB;

-- Inserciones para la tabla PreguntasFrecuentes
INSERT INTO `televecinosDB`.`PreguntasFrecuentes` (`pregunta`, `repuesta`, `fechaModificacion`) VALUES
('¿Cuál es el horario de atención?', 'Nuestro horario de atención es de 9am a 6pm.', '2024-01-02 00:00:00.000000'),
('¿Dónde están ubicados?', 'Estamos ubicados en San Miguel, Lima.', '2024-01-03 00:00:00.000000'),
('¿Cómo puedo contactar soporte?', 'Puede contactar soporte vía email o teléfono.', '2024-01-04 00:00:00.000000'),
('¿Dónde puedo ver los eventos próximos?', 'Puede ver los eventos próximos en nuestra sección de eventos.', '2024-01-09 00:00:00.000000'),
('¿Cómo puedo recuperar mi contraseña?', 'Puede recuperar su contraseña desde la página de inicio de sesión.', '2024-01-11 00:00:00.000000'),
('¿Puedo asistir a eventos sin registrarme?', 'No, es necesario registrarse para asistir a los eventos.', '2024-01-15 00:00:00.000000');

-- -----------------------------------------------------
-- Table `televecinosDB`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `tipoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;

-- Inserciones para la tabla Rol
INSERT INTO `televecinosDB`.`Rol` (`tipoRol`) VALUES
('Solicitante'), ('Vecino'), ('Coordinadora'), ('Serenazgo'), ('Administrador');

-- -----------------------------------------------------
-- Table `televecinosDB`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `Urbanizacion_idUrbanizacion` INT NOT NULL,
  `TipoCoordinador_idTipoCoordinador` INT NULL,
  `asistencia` TINYINT NULL,
  `avatar` LONGBLOB NOT NULL,
  `PreguntasFrecuentes_idtable2` INT NOT NULL,
  `Rol_idRol` INT NOT NULL,
  `isBan` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Urbanizacion_idx` (`Urbanizacion_idUrbanizacion` ASC) VISIBLE,
  INDEX `fk_Usuario_TipoCoordinador1_idx` (`TipoCoordinador_idTipoCoordinador` ASC) VISIBLE,
  INDEX `fk_Usuario_PreguntasFrecuentes1_idx` (`PreguntasFrecuentes_idtable2` ASC) VISIBLE,
  INDEX `fk_Usuario_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Urbanizacion`
    FOREIGN KEY (`Urbanizacion_idUrbanizacion`)
    REFERENCES `televecinosDB`.`Urbanizacion` (`idUrbanizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoCoordinador1`
    FOREIGN KEY (`TipoCoordinador_idTipoCoordinador`)
    REFERENCES `televecinosDB`.`TipoCoordinador` (`idTipoCoordinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_PreguntasFrecuentes1`
    FOREIGN KEY (`PreguntasFrecuentes_idtable2`)
    REFERENCES `televecinosDB`.`PreguntasFrecuentes` (`idtable2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `televecinosDB`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Inserciones para la tabla Usuario
INSERT INTO `televecinosDB`.`Usuario` (
  `nombre`, 
  `apellido`, 
  `dni`, 
  `direccion`, 
  `correo`, 
  `contrasena`, 
  `Urbanizacion_idUrbanizacion`, 
  `TipoCoordinador_idTipoCoordinador`, 
  `asistencia`, 
  `avatar`, 
  `PreguntasFrecuentes_idtable2`, 
  `Rol_idRol`, 
  `isBan`
) VALUES
('Luis', 'García', '12345678', 'Calle Alfonso Ugarte 127, Rafael Escardó', 'luis.garcia@example.com', 'password1', 1, 1, 1, 'avatar', 1, 1, 0),
('César', 'Ramírez', '22345678', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', 'password2', 2, 2, 1, 'avatar', 2, 2, 0),
('María', 'Fernández', '32345678', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', 'password3', 3, 1, 1, 'avatar', 3, 1, 0),
('Ana', 'Rodríguez', '42345678', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', 'password4', 4, 2, 1, 'avatar', 4, 2, 0),
('Pedro', 'Martínez', '52345678', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', 'password5', 5, 1, 1, 'avatar', 5, 1, 0),
('Juan', 'López', '62345678', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', 'password6', 6, 2, 1, 'avatar', 6, 2, 0),
('Carlos', 'González', '72345678', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', 'password7', 7, 1, 1, 'avatar', 7, 1, 0),
('Sofía', 'Pérez', '82345678', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', 'password8', 8, 2, 1, 'avatar', 8, 2, 0),
('Lucía', 'Díaz', '92345678', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', 'password9', 9, 1, 1, 'avatar', 9, 1, 0),
('Miguel', 'Hernández', '10345678', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', 'password10', 10, 2, 1, 'avatar', 10, 2, 0),
('Elena', 'Jiménez', '11345678', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', 'password11', 11, 1, 1, 'avatar', 11, 1, 0),
('Valeria', 'Ruiz', '12345679', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', 'password12', 12, 2, 1, 'avatar', 12, 2, 0),
('Diego', 'Morales', '13345678', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', 'password13', 1, 1, 1, 'avatar', 1, 1, 0),
('Andrea', 'Ortiz', '14345678', 'Avenida La Marina 1462, José de La Riva Agüero', 'andrea.ortiz@example.com', 'password14', 2, 2, 1, 'avatar', 2, 2, 0),
('Fernando', 'Castro', '15345678', 'Jirón Bolognesi 1573, Juan XXIII', 'fernando.castro@example.com', 'password15', 3, 1, 1, 'avatar', 3, 1, 0),
('Gabriela', 'Torres', '16345678', 'Calle Tacna 1684, Libertad', 'gabriela.torres@example.com', 'password16', 4, 2, 1, 'avatar', 4, 2, 0),
('Sergio', 'Flores', '17345678', 'Avenida Faucett 1795, Los Jardines de La Marina', 'sergio.flores@example.com', 'password17', 5, 1, 1, 'avatar', 5, 1, 0),
('Isabel', 'Mendoza', '18345678', 'Jirón Inclán 1806, Las Leyendas', 'isabel.mendoza@example.com', 'password18', 6, 2, 1, 'avatar', 6, 2, 0),
('Alejandro', 'Romero', '19345678', 'Calle Olaya 1917, Las Torres San Miguelito', 'alejandro.romero@example.com', 'password19', 7, 1, 1, 'avatar', 7, 1, 0),
('Patricia', 'Vega', '20345678', 'Avenida Precursores 2028, Elmer Faucett', 'patricia.vega@example.com', 'password20', 8, 2, 1, 'avatar', 8, 2, 0),
('Ricardo', 'Soto', '21345678', 'Jirón Manco Cápac 2139, Maranga', 'ricardo.soto@example.com', 'password21', 9, 1, 1, 'avatar', 9, 1, 0),
('Paula', 'Silva', '22345678', 'Calle Independencia 2250, Pando', 'paula.silva@example.com', 'password22', 10, 2, 1, 'avatar', 10, 2, 0),
('Hugo', 'Rojas', '23345678', 'Avenida Bertoloto 2361, Parques de La Huaca', 'hugo.rojas@example.com', 'password23', 11, 1, 1, 'avatar', 11, 1, 0),
('Verónica', 'Peña', '24345678', 'Jirón Chancay 2472, Otro', 'veronica.pena@example.com', 'password24', 12, 2, 1, 'avatar', 12, 2, 0),
('Oscar', 'Cruz', '25345678', 'Calle Grau 2583, Rafael Escardó', 'oscar.cruz@example.com', 'password25', 1, 1, 1, 'avatar', 1, 1, 0),
('Javier', 'Reyes', '26345678', 'Avenida Los Patriotas 2694, José de La Riva Agüero', 'javier.reyes@example.com', 'password26', 2, 2, 1, 'avatar', 2, 2, 0),
('Natalia', 'Campos', '27345678', 'Jirón Sucre 2705, Juan XXIII', 'natalia.campos@example.com', 'password27', 3, 1, 1, 'avatar', 3, 1, 0),
('Cristina', 'Ramos', '28345678', 'Calle Salaverry 2816, Libertad', 'cristina.ramos@example.com', 'password28', 4, 2, 1, 'avatar', 4, 2, 0),
('Pablo', 'Aguilar', '29345678', 'Avenida La Marina 2927, Los Jardines de La Marina', 'pablo.aguilar@example.com', 'password29', 5, 1, 1, 'avatar', 5, 1, 0),
('Lorena', 'Guzmán', '30345678', 'Jirón Manco Cápac 3038, Las Leyendas', 'lorena.guzman@example.com', 'password30', 6, 2, 1, 'avatar', 6, 2, 0),
('Luis', 'García', '12345670', 'Calle Alfonso Ugarte 127, Rafael Escardó', 'luis.garcia@example.com', 'password1', 1, 1, 1, 'avatar', 1, 1, 0),
('César', 'Ramírez', '22345670', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', 'password2', 2, 2, 1, 'avatar', 2, 2, 0),
('María', 'Fernández', '32345670', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', 'password3', 3, 1, 1, 'avatar', 3, 1, 0),
('Ana', 'Rodríguez', '42345670', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', 'password4', 4, 2, 1, 'avatar', 4, 2, 0),
('Pedro', 'Martínez', '52345670', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', 'password5', 5, 1, 1, 'avatar', 5, 1, 0),
('Juan', 'López', '62345670', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', 'password6', 6, 2, 1, 'avatar', 6, 2, 0),
('Carlos', 'González', '72345670', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', 'password7', 7, 1, 1, 'avatar', 7, 1, 0),
('Sofía', 'Pérez', '82345670', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', 'password8', 8, 2, 1, 'avatar', 8, 2, 0),
('Lucía', 'Díaz', '92345670', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', 'password9', 9, 1, 1, 'avatar', 9, 1, 0),
('Miguel', 'Hernández', '10345670', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', 'password10', 10, 2, 1, 'avatar', 10, 2, 0),
('Elena', 'Jiménez', '11345670', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', 'password11', 11, 1, 1, 'avatar', 11, 1, 0),
('Valeria', 'Ruiz', '12345671', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', 'password12', 12, 2, 1, 'avatar', 12, 2, 0),
('Diego', 'Morales', '13345670', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', 'password13', 1, 1, 1, 'avatar', 1, 1, 0),
('Andrea', 'Ortiz', '14345670', 'Avenida La Marina 1462, José de La Riva Agüero', 'andrea.ortiz@example.com', 'password14', 2, 2, 1, 'avatar', 2, 2, 0),
('Fernando', 'Castro', '15345670', 'Jirón Bolognesi 1573, Juan XXIII', 'fernando.castro@example.com', 'password15', 3, 1, 1, 'avatar', 3, 1, 0),
('Gabriela', 'Torres', '16345670', 'Calle Tacna 1684, Libertad', 'gabriela.torres@example.com', 'password16', 4, 2, 1, 'avatar', 4, 2, 0),
('Sergio', 'Flores', '17345670', 'Avenida Faucett 1795, Los Jardines de La Marina', 'sergio.flores@example.com', 'password17', 5, 1, 1, 'avatar', 5, 1, 0),
('Isabel', 'Mendoza', '18345670', 'Jirón Inclán 1806, Las Leyendas', 'isabel.mendoza@example.com', 'password18', 6, 2, 1, 'avatar', 6, 2, 0),
('Alejandro', 'Romero', '19345670', 'Calle Olaya 1917, Las Torres San Miguelito', 'alejandro.romero@example.com', 'password19', 7, 1, 1, 'avatar', 7, 1, 0),
('Patricia', 'Vega', '20345670', 'Avenida Precursores 2028, Elmer Faucett', 'patricia.vega@example.com', 'password20', 8, 2, 1, 'avatar', 8, 2, 0),
('Ricardo', 'Soto', '21345670', 'Jirón Manco Cápac 2139, Maranga', 'ricardo.soto@example.com', 'password21', 9, 1, 1, 'avatar', 9, 1, 0),
('Paula', 'Silva', '22345670', 'Calle Independencia 2250, Pando', 'paula.silva@example.com', 'password22', 10, 2, 1, 'avatar', 10, 2, 0),
('Hugo', 'Rojas', '23345670', 'Avenida Bertoloto 2361, Parques de La Huaca', 'hugo.rojas@example.com', 'password23', 11, 1, 1, 'avatar', 11, 1, 0),
('Verónica', 'Peña', '24345670', 'Jirón Chancay 2472, Otro', 'veronica.pena@example.com', 'password24', 12, 2, 1, 'avatar', 12, 2, 0),
('Oscar', 'Cruz', '25345670', 'Calle Grau 2583, Rafael Escardó', 'oscar.cruz@example.com', 'password25', 1, 1, 1, 'avatar', 1, 1, 0),
('Javier', 'Reyes', '26345670', 'Avenida Los Patriotas 2694, José de La Riva Agüero', 'javier.reyes@example.com', 'password26', 2, 2, 1, 'avatar', 2, 2, 0),
('Natalia', 'Campos', '27345670', 'Jirón Sucre 2705, Juan XXIII', 'natalia.campos@example.com', 'password27', 3, 1, 1, 'avatar', 3, 1, 0),
('Cristina', 'Ramos', '28345670', 'Calle Salaverry 2816, Libertad', 'cristina.ramos@example.com', 'password28', 4, 2, 1, 'avatar', 4, 2, 0),
('Pablo', 'Aguilar', '29345670', 'Avenida La Marina 2927, Los Jardines de La Marina', 'pablo.aguilar@example.com', 'password29', 5, 1, 1, 'avatar', 5, 1, 0),
('Lorena', 'Guzmán', '30345670', 'Jirón Manco Cápac 3038, Las Leyendas', 'lorena.guzman@example.com', 'password30', 6, 2, 1, 'avatar', 6, 2, 0),


-- Administrador------
('Municipalidad', 'De san Miguel', '-', '-', 'lorena.guzman@example.com', 'admintelevecinos', 0, 0, 1, 'avatar', 6, 5, 0);



-- -----------------------------------------------------
-- Table `televecinosDB`.`EventEstados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`EventEstados` (
  `idEventEstados` INT NOT NULL AUTO_INCREMENT,
  `estadosEvento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventEstados`))
ENGINE = InnoDB;

-- Inserciones para la tabla EventEstados
INSERT INTO `televecinosDB`.`EventEstados` (`estadosEvento`) VALUES
('Disponible'), ('En curso'), ('Finalizado');

-- -----------------------------------------------------
-- Table `televecinosDB`.`EventFrecuencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`EventFrecuencia` (
  `idEventFrecuencia` INT NOT NULL AUTO_INCREMENT,
  `tipoFrecuencia` VARCHAR(45) NOT NULL,
  `dia1` DATE NOT NULL,
  `dia2` DATE NULL,
  PRIMARY KEY (`idEventFrecuencia`))
ENGINE = InnoDB;

-- Inserciones para la tabla EventFrecuencia
INSERT INTO `televecinosDB`.`EventFrecuencia` (`tipoFrecuencia`, `dia1`, `dia2`) VALUES
('Dos veces por semana', '2024-03-11', '2024-03-14'), 
('Semanal', '2024-03-12', NULL),
('Dos veces por semana', '2024-03-18', '2024-03-21'), 
('Semanal', '2024-03-19', NULL),
('Dos veces por semana', '2024-03-25', '2024-03-28'), 
('Semanal', '2024-03-26', NULL),
('Dos veces por semana', '2024-04-01', '2024-04-04'), 
('Semanal', '2024-04-02', NULL),
('Dos veces por semana', '2024-04-08', '2024-04-11'), 
('Semanal', '2024-04-09', NULL),
('Dos veces por semana', '2024-04-15', '2024-04-18'), 
('Semanal', '2024-04-16', NULL),
('Dos veces por semana', '2024-04-22', '2024-04-25'), 
('Semanal', '2024-04-23', NULL),
('Dos veces por semana', '2024-04-29', '2024-05-02'), 
('Semanal', '2024-04-30', NULL),
('Dos veces por semana', '2024-05-06', '2024-05-09'), 
('Semanal', '2024-05-07', NULL),
('Dos veces por semana', '2024-05-13', '2024-05-16'), 
('Semanal', '2024-05-14', NULL),
('Dos veces por semana', '2024-05-20', '2024-05-23'), 
('Semanal', '2024-05-21', NULL),
('Dos veces por semana', '2024-05-27', '2024-05-30'), 
('Semanal', '2024-05-28', NULL),
('Dos veces por semana', '2024-06-03', '2024-06-06'), 
('Semanal', '2024-06-04', NULL),
('Dos veces por semana', '2024-06-10', '2024-06-13'), 
('Semanal', '2024-06-11', NULL),
('Dos veces por semana', '2024-06-17', '2024-06-20'), 
('Semanal', '2024-06-18', NULL),
('Dos veces por semana', '2024-06-24', '2024-06-27'), 
('Semanal', '2024-06-25', NULL);


-- -----------------------------------------------------
-- Table `televecinosDB`.`TipoEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`TipoEvento` (
  `idTipoEvento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEvento`))
ENGINE = InnoDB;

-- Inserciones para la tabla TipoEvento
INSERT INTO `televecinosDB`.`TipoEvento` (`tipo`) VALUES
('Evento Cultural'),
('Evento Deportivo');


-- -----------------------------------------------------
-- Table `televecinosDB`.`ProfesoresEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`ProfesoresEvento` (
  `idProfesoresEvento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido` VARCHAR(150) NOT NULL,
  `curso` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idProfesoresEvento`))
ENGINE = InnoDB;

-- Inserciones para la tabla ProfesoresEvento
INSERT INTO `televecinosDB`.`ProfesoresEvento` (`nombre`, `apellido`, `curso`) VALUES
-- Cursos de Cultura
('Roberto', 'Alvarez', 'Historia del Arte'), 
('Camila', 'Blanco', 'Literatura'), 
('Mateo', 'Cárdenas', 'Teatro'), 
('Renata', 'Díaz', 'Música'), 
('Julian', 'Espinoza', 'Geografía Cultural'), 
('Nicolás', 'Fernández', 'Filosofía'), 
('Valeria', 'García', 'Danza'), 
('Santiago', 'Hernández', 'Pintura'), 
('Isabela', 'Iglesias', 'Fotografía'), 
('Daniel', 'Jiménez', 'Escritura Creativa'),

-- Cursos de Deportes
('Martina', 'Kaiser', 'Fútbol'), 
('Sebastián', 'López', 'Baloncesto'), 
('Mariana', 'Martínez', 'Natación'), 
('Diego', 'Núñez', 'Atletismo'), 
('Lucía', 'Orozco', 'Voleibol'), 
('Alonso', 'Pérez', 'Tenis'), 
('Carolina', 'Quintana', 'Gimnasia'), 
('Fernando', 'Ramírez', 'Ciclismo'), 
('Elena', 'Suárez', 'Boxeo'), 
('Andrés', 'Torres', 'Karate');


-- -----------------------------------------------------
-- Table `televecinosDB`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Eventos` (
  `idEventos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `lugar` VARCHAR(150) NOT NULL,
  `Coordinador_idUsuario` INT NOT NULL,
  `fecha_inicio` DATETIME NOT NULL,
  `fecha_fin` DATETIME NOT NULL,
  `cantidadVacantes` INT NOT NULL,
  `cantDisponibles` INT NOT NULL,
  `foto` LONGBLOB NOT NULL,
  `listaMateriales` VARCHAR(150) NOT NULL,
  `EventEstados_idEventEstados` INT NOT NULL,
  `EventFrecuencia_idEventFrecuencia` INT NOT NULL,
  `TipoEvento_idTipoEvento` INT NOT NULL,
  `ProfesoresEvento_idProfesoresEvento` INT NOT NULL,
  PRIMARY KEY (`idEventos`),
  INDEX `fk_Eventos_EventEstados1_idx` (`EventEstados_idEventEstados` ASC) VISIBLE,
  INDEX `fk_Eventos_EventFrecuencia1_idx` (`EventFrecuencia_idEventFrecuencia` ASC) VISIBLE,
  INDEX `fk_Eventos_TipoEvento1_idx` (`TipoEvento_idTipoEvento` ASC) VISIBLE,
  INDEX `fk_Eventos_Usuario1_idx` (`Coordinador_idUsuario` ASC) VISIBLE,
  INDEX `fk_Eventos_ProfesoresEvento1_idx` (`ProfesoresEvento_idProfesoresEvento` ASC) VISIBLE,
  CONSTRAINT `fk_Eventos_EventEstados1`
    FOREIGN KEY (`EventEstados_idEventEstados`)
    REFERENCES `televecinosDB`.`EventEstados` (`idEventEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_EventFrecuencia1`
    FOREIGN KEY (`EventFrecuencia_idEventFrecuencia`)
    REFERENCES `televecinosDB`.`EventFrecuencia` (`idFrecuencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_TipoEvento1`
    FOREIGN KEY (`TipoEvento_idTipoEvento`)
    REFERENCES `televecinosDB`.`TipoEvento` (`idTipoEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_Usuario1`
    FOREIGN KEY (`Coordinador_idUsuario`)
    REFERENCES `televecinosDB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_ProfesoresEvento1`
    FOREIGN KEY (`ProfesoresEvento_idProfesoresEvento`)
    REFERENCES `televecinosDB`.`ProfesoresEvento` (`idProfesoresEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Inserciones para la tabla Eventos (Eventos Culturales)
INSERT INTO `televecinosDB`.`Eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`) VALUES
('Conferencia Cultural sobre Historia del Arte', 'Una conferencia detallada sobre la evolución del arte a lo largo de los siglos', 'Museo Larco', 1, '2024-06-01 10:00:00', '2024-06-01 12:00:00', 100, 100, 'imagen1.jpg', 'Proyector, Apuntes', 2, 1, 1, 1),
('Seminario de Arte Moderno', 'Exploración de las tendencias del arte moderno', 'Casa de la Cultura', 2, '2024-06-02 14:00:00', '2024-06-02 16:00:00', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 2, 1, 2),
('Taller de Escritura Creativa', 'Desarrolla tus habilidades en escritura creativa', 'Biblioteca Municipal de San Miguel', 3, '2024-06-03 09:00:00', '2024-06-03 11:00:00', 30, 30, 'default.jpg', 'Cuadernos, Plumas', 1, 3, 1, 3),
('Webinar de Literatura Clásica', 'Discusión en línea sobre obras literarias clásicas', 'Online', 4, '2024-06-04 17:00:00', '2024-06-04 18:30:00', 200, 200, 'default.jpg', 'Computadora, Internet', 3, 4, 1, 4),
('Foro de Filosofía Contemporánea', 'Debate sobre temas de filosofía contemporánea', 'Centro Cultural de San Miguel', 5, '2024-06-05 10:00:00', '2024-06-05 12:00:00', 40, 40, 'default.jpg', 'Apuntes, Libros', 1, 5, 1, 5),
('Mesa Redonda de Historia Mundial', 'Discusión sobre eventos históricos importantes', 'Auditorio Municipal', 6, '2024-06-06 14:00:00', '2024-06-06 16:00:00', 60, 60, 'default.jpg', 'Micrófonos, Proyector', 3, 6, 1, 6),
('Panel de Discusión de Música Clásica', 'Análisis de obras maestras de la música clásica', 'Sala de Música del Centro Cultural', 7, '2024-06-07 10:00:00', '2024-06-07 12:00:00', 50, 50, 'default.jpg', 'Instrumentos, Partituras', 2, 7, 1, 7),
('Charla de Teatro Moderno', 'Introducción a las técnicas del teatro moderno', 'Aula de Teatro del Centro Cultural', 8, '2024-06-08 09:00:00', '2024-06-08 11:00:00', 25, 25, 'default.jpg', 'Ropa cómoda, Guiones', 3, 8, 1, 8),
('Presentación de Pintura Renacentista', 'Exposición de obras de la era renacentista', 'Galería de Arte del Centro Cultural', 9, '2024-06-09 15:00:00', '2024-06-09 17:00:00', 100, 100, 'default.jpg', 'Folletos, Audioguías', 1, 9, 1, 9),
('Exposición de Fotografía Contemporánea', 'Muestra de fotografías contemporáneas', 'Sala de Exposiciones del Centro Cultural', 10, '2024-06-10 11:00:00', '2024-06-10 13:00:00', 80, 80, 'default.jpg', 'Catálogos, Monturas', 2, 10, 1, 10),
('Taller de Escultura', 'Curso intensivo sobre técnicas de escultura', 'Casa de la Cultura', 1, '2024-06-21 10:00:00', '2024-06-21 12:00:00', 20, 20, 'default.jpg', 'Arcilla, Herramientas', 3, 11, 1, 1),
('Concierto de Música Andina', 'Disfruta de una presentación de música andina', 'Auditorio Municipal', 2, '2024-06-22 18:00:00', '2024-06-22 20:00:00', 200, 200, 'default.jpg', 'Instrumentos Andinos', 1, 12, 1, 2),
('Exposición de Arte Contemporáneo', 'Muestra de arte contemporáneo', 'Galería de Arte del Centro Cultural', 3, '2024-06-23 11:00:00', '2024-06-23 13:00:00', 100, 100, 'default.jpg', 'Catálogos, Monturas', 2, 13, 1, 3),
('Cineforo: Clásicos del Cine', 'Proyección y debate sobre clásicos del cine', 'Centro Cultural de San Miguel', 4, '2024-06-24 17:00:00', '2024-06-24 20:00:00', 80, 80, 'default.jpg', 'Proyector, Asientos', 2, 14, 1, 4),
('Recital de Poesía', 'Lectura de poesía contemporánea', 'Biblioteca Municipal de San Miguel', 5, '2024-06-25 19:00:00', '2024-06-25 21:00:00', 50, 50, 'default.jpg', 'Micrófonos, Podio', 3, 15, 1, 5),
('Festival de Teatro Infantil', 'Obras de teatro para niños', 'Aula de Teatro del Centro Cultural', 6, '2024-06-26 10:00:00', '2024-06-26 12:00:00', 60, 60, 'default.jpg', 'Vestuario, Escenografía', 1, 16, 1, 6),
('Curso de Fotografía Digital', 'Aprende las técnicas básicas de la fotografía digital', 'Sala de Exposiciones del Centro Cultural', 7, '2024-06-27 09:00:00', '2024-06-27 11:00:00', 25, 25, 'default.jpg', 'Cámaras, Ordenadores', 3, 17, 1, 7),
('Presentación de Danza Folclórica', 'Espectáculo de danza tradicional', 'Plaza San Miguel', 8, '2024-06-28 18:00:00', '2024-06-28 20:00:00', 150, 150, 'default.jpg', 'Trajes típicos, Música', 2, 18, 1, 8),
('Taller de Guionismo', 'Curso sobre escritura de guiones para cine y TV', 'Centro Cultural de San Miguel', 9, '2024-06-29 14:00:00', '2024-06-29 16:00:00', 20, 20, 'default.jpg', 'Cuadernos, Lápices', 1, 19, 1, 9),
('Exposición de Grabado', 'Muestra de grabados de artistas locales', 'Galería de Arte del Centro Cultural', 10, '2024-06-30 11:00:00', '2024-06-30 13:00:00', 70, 70, 'default.jpg', 'Catálogos, Monturas', 2, 20, 1, 10);

-- Inserciones para la tabla Eventos (Eventos Deportivos)
INSERT INTO `televecinosDB`.`Eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`) VALUES
('Conferencia Deportiva sobre Fútbol', 'Una conferencia sobre estrategias y tácticas en fútbol', 'Estadio San Miguel', 11, '2024-06-01 15:00:00', '2024-06-01 17:00:00', 100, 100, 'default.jpg', 'Proyector, Apuntes', 2, 21, 2, 11),
('Seminario de Nutrición Deportiva', 'Discusión sobre la importancia de la nutrición en el deporte', 'Casa del Deporte', 12, '2024-06-02 10:00:00', '2024-06-02 12:00:00', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 22, 2, 12),
('Taller de Entrenamiento Funcional', 'Entrenamiento intensivo para mejorar la condición física', 'Gimnasio Municipal', 13, '2024-06-03 08:00:00', '2024-06-03 10:00:00', 30, 30, 'default.jpg', 'Ropa deportiva, Agua', 1, 23, 2, 13),
('Webinar de Psicología Deportiva', 'Conferencia en línea sobre la psicología aplicada al deporte', 'Online', 14, '2024-06-04 17:00:00', '2024-06-04 18:30:00', 200, 200, 'default.jpg', 'Computadora, Internet', 1, 24, 2, 14),
('Foro de Deporte y Salud', 'Debate sobre los beneficios del deporte para la salud', 'Centro Deportivo San Miguel', 15, '2024-06-05 10:00:00', '2024-06-05 12:00:00', 40, 40, 'default.jpg', 'Apuntes, Libros', 2, 25, 2, 15),
('Mesa Redonda de Deporte Adaptado', 'Discusión sobre el deporte adaptado para personas con discapacidad', 'Auditorio Municipal', 16, '2024-06-06 14:00:00', '2024-06-06 16:00:00', 60, 60, 'default.jpg', 'Micrófonos, Proyector', 3, 26, 2, 16),
('Panel de Discusión sobre Entrenamiento de Fuerza', 'Análisis de métodos de entrenamiento de fuerza', 'Sala de Conferencias del Centro Deportivo', 17, '2024-06-07 10:00:00', '2024-06-07 12:00:00', 50, 50, 'default.jpg', 'Pesas, Apuntes', 3, 27, 2, 17),
('Charla de Deportes Acuáticos', 'Introducción a los deportes acuáticos', 'Piscina Municipal', 18, '2024-06-08 09:00:00', '2024-06-08 11:00:00', 25, 25, 'default.jpg', 'Traje de baño, Gorra', 2, 28, 2, 18),
('Presentación de Artes Marciales', 'Demostración de diferentes artes marciales', 'Dojo Municipal', 19, '2024-06-09 15:00:00', '2024-06-09 17:00:00', 100, 100, 'default.jpg', 'Uniforme, Cinturón', 1, 29, 2, 19),
('Exposición de Equipos Deportivos', 'Muestra de equipos y accesorios deportivos', 'Sala de Exposiciones del Centro Deportivo', 20, '2024-06-10 11:00:00', '2024-06-10 13:00:00', 80, 80, 'default.jpg', 'Catálogos, Muestras', 3, 30, 2, 20),
('Clínica de Baloncesto', 'Sesión de entrenamiento intensivo en baloncesto', 'Gimnasio Municipal', 21, '2024-06-21 10:00:00', '2024-06-21 12:00:00', 20, 20, 'default.jpg', 'Balones, Aros', 1, 31, 2, 11),
('Torneo de Tenis', 'Competencia de tenis abierta a todos', 'Club de Tenis San Miguel', 22, '2024-06-22 18:00:00', '2024-06-22 20:00:00', 200, 200, 'default.jpg', 'Raquetas, Pelotas', 2, 32, 2, 12),
('Clínica de Atletismo', 'Entrenamiento en diferentes disciplinas de atletismo', 'Pista de Atletismo del Centro Deportivo', 23, '2024-06-23 11:00:00', '2024-06-23 13:00:00', 100, 100, 'default.jpg', 'Ropa deportiva, Zapatillas', 2, 33, 2, 13),
('Exhibición de Gimnasia', 'Demostración de habilidades gimnásticas', 'Gimnasio Municipal', 24, '2024-06-24 17:00:00', '2024-06-24 19:00:00', 80, 80, 'default.jpg', 'Equipos de gimnasia, Música', 3, 34, 2, 14),
('Recital de Yoga', 'Sesión de yoga abierta a todos', 'Parque San Miguel', 25, '2024-06-25 08:00:00', '2024-06-25 10:00:00', 50, 50, 'default.jpg', 'Esterillas, Agua', 1, 35,2, 15),
('Festival de Deportes Extremos', 'Demostración y competencias de deportes extremos', 'Plaza de Deportes', 26, '2024-06-26 10:00:00', '2024-06-26 16:00:00', 60, 60, 'default.jpg', 'Equipos de seguridad, Tablas', 2, 36, 2, 16),
('Curso de Entrenamiento en Altura', 'Técnicas de entrenamiento en condiciones de altura', 'Centro de Alto Rendimiento', 27, '2024-06-27 09:00:00', '2024-06-27 11:00:00', 25, 25, 'default.jpg', 'Ropa deportiva, Agua', 1, 37, 2, 17),
('Competencia de Natación', 'Competencia abierta de natación', 'Piscina Municipal', 28, '2024-06-28 08:00:00', '2024-06-28 10:00:00', 150, 150, 'default.jpg', 'Traje de baño, Gorra', 1, 38, 2, 18),
('Taller de Yoga para Niños', 'Sesión de yoga diseñada para niños', 'Parque San Miguel', 29, '2024-06-29 14:00:00', '2024-06-29 15:00:00', 20, 20, 'default.jpg', 'Esterillas, Agua', 2, 39, 2, 19),
('Exposición de Fotografía Deportiva', 'Muestra de fotografías relacionadas con el deporte', 'Sala de Exposiciones del Centro Deportivo', 30, '2024-06-30 11:00:00', '2024-06-30 13:00:00', 70, 70, 'default.jpg', 'Catálogos, Monturas', 3, 40, 2, 20);




-- -----------------------------------------------------
-- Table `televecinosDB`.`Flujo_Usuario_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Flujo_Usuario_Evento` (
  `idListaParticipantes` INT UNSIGNED NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Eventos_idEventos` INT NOT NULL,
  PRIMARY KEY (`idListaParticipantes`),
  INDEX `fk_ListaParticipantes_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_ListaParticipantes_Eventos1_idx` (`Eventos_idEventos` ASC) VISIBLE,
  CONSTRAINT `fk_ListaParticipantes_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `televecinosDB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaParticipantes_Eventos1`
    FOREIGN KEY (`Eventos_idEventos`)
    REFERENCES `televecinosDB`.`Eventos` (`idEventos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `televecinosDB`.`CriticidadIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`CriticidadIncidencia` (
  `idCriticidadIncidencia` INT NOT NULL AUTO_INCREMENT,
  `criticidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCriticidadIncidencia`))
ENGINE = InnoDB;
-- Inserciones para la tabla CriticidadIncidencia
INSERT INTO `televecinosDB`.`CriticidadIncidencia` (`criticidad`) VALUES
('Baja'), ('Media'), ('Alta');

-- -----------------------------------------------------
-- Table `televecinosDB`.`TipoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`TipoIncidencia` (
  `idTipoIncidencia` INT NOT NULL AUTO_INCREMENT,
  `TipoIncidencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoIncidencia`))
ENGINE = InnoDB;

-- Inserciones para la tabla TipoIncidencia
INSERT INTO `televecinosDB`.`EstadosIncidencia` (`estado`) VALUES
('Seguridad Pública'), ('Emergencia pública'), ('Infraestructura y Servicios Publicos'), ('Otro');

-- -----------------------------------------------------
-- Table `televecinosDB`.`EstadosIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`EstadosIncidencia` (
  `idEstadosIncidencia` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadosIncidencia`))
ENGINE = InnoDB;
-- Inserciones para la tabla EstadosIncidencia
INSERT INTO `televecinosDB`.`EstadosIncidencia` (`estado`) VALUES
('Pendiente'), ('En Curso'), ('Cancelado'), ('Rechazado'), ('Procesado');

-- -----------------------------------------------------
-- Table `televecinosDB`.`Incidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Incidencias` (
  `idIncidencias` INT NOT NULL AUTO_INCREMENT,
  `nombreIncidencia` VARCHAR(100) NOT NULL,
  `lugarExacto` VARCHAR(100) NOT NULL,
  `referencia` VARCHAR(150) NOT NULL,
  `foto` LONGBLOB NOT NULL,
  `ambulancia` TINYINT NOT NULL,
  `numeroContacto` VARCHAR(45) NULL,
  `CriticidadIncidencia_idCriticidadIncidencia` INT NOT NULL,
  `TipoIncidencia_idTipoIncidencia` INT NOT NULL,
  `EstadosIncidencia_idEstadosIncidencia` INT NOT NULL,
  `Serenazgo_idSerenazgo` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `incidenciaPersonal` TINYINT NOT NULL,
  PRIMARY KEY (`idIncidencias`),
  INDEX `fk_Incidencias_CriticidadIncidencia1_idx` (`CriticidadIncidencia_idCriticidadIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencias_EstadosIncidencia1_idx` (`EstadosIncidencia_idEstadosIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencias_Serenazgo1_idx` (`Serenazgo_idSerenazgo` ASC) VISIBLE,
  INDEX `fk_Incidencias_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Incidencias_TipoIncidencia1_idx` (`TipoIncidencia_idTipoIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Incidencias_CriticidadIncidencia1`
    FOREIGN KEY (`CriticidadIncidencia_idCriticidadIncidencia`)
    REFERENCES `televecinosDB`.`CriticidadIncidencia` (`idCriticidadIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_EstadosIncidencia1`
    FOREIGN KEY (`EstadosIncidencia_idEstadosIncidencia`)
    REFERENCES `televecinosDB`.`EstadosIncidencia` (`idEstadosIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_Serenazgo1`
    FOREIGN KEY (`Serenazgo_idSerenazgo`)
    REFERENCES `televecinosDB`.`Serenazgo` (`idSerenazgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `televecinosDB`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_TipoIncidencia1`
    FOREIGN KEY (`TipoIncidencia_idTipoIncidencia`)
    REFERENCES `televecinosDB`.`TipoIncidencia` (`idTipoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Inserciones para la tabla Incidencias
INSERT INTO `televecinosDB`.`Incidencias` (
  `nombreIncidencia`, 
  `lugarExacto`, 
  `referencia`, 
  `foto`, 
  `ambulancia`, 
  `numeroContacto`, 
  `CriticidadIncidencia_idCriticidadIncidencia`, 
  `EstadosIncidencia_idEstadosIncidencia`, 
  `Serenazgo_idSerenazgo`, 
  `Usuario_idUsuario`, 
  `incidenciaPersonal`
) VALUES
('Robo', 'Av. La Marina 1234, Urbanización Maranga', 'Cerca de la Plaza San Miguel', 'foto_1.jpg', 0, '987654321', 1, 1, 1, 1, 0),
('Asalto', 'Av. Universitaria 5678, Urbanización Pando', 'Frente al Centro Comercial Plaza San Miguel', 'foto_2.jpg', 1, '987654322', 2, 2, 2, 2, 0),
('Accidente de Tránsito', 'Jirón Pescadores 123, Urbanización San Miguelito', 'Intersección con Av. La Marina', 'foto_3.jpg', 1, '987654323', 3, 3, 3, 3, 0),
('Incendio', 'Calle Bolognesi 456, Urbanización Parque de las Leyendas', 'Edificio Residencial', 'foto_4.jpg', 1, '987654324', 1, 4, 4, 4, 0),
('Emergencia Médica', 'Av. Bertolotto 789, Urbanización San Miguel', 'Cerca del Hospital San José', 'foto_5.jpg', 0, '987654325', 2, 5, 5, 5, 1),
('Violencia Doméstica', 'Jirón Mantaro 101, Urbanización Miramar', 'Vivienda Unifamiliar', 'foto_6.jpg', 0, '987654326', 3, 1, 6, 6, 1),
('Robo', 'Calle Salaverry 102, Urbanización Maranga', 'En la esquina', 'foto_7.jpg', 0, '987654327', 1, 2, 7, 7, 0),
('Asalto', 'Av. Faucett 103, Urbanización Pando', 'Cerca de la escuela', 'foto_8.jpg', 1, '987654328', 2, 3, 8, 8, 0),
('Accidente de Tránsito', 'Jirón Libertad 104, Urbanización San Miguelito', 'Frente al parque', 'foto_9.jpg', 1, '987654329', 3, 4, 9, 9, 0),
('Incendio', 'Calle Precursores 105, Urbanización Parque de las Leyendas', 'Cerca del mercado', 'foto_10.jpg', 1, '987654330', 1, 5, 10, 10, 0),
('Emergencia Médica', 'Av. Costanera 106, Urbanización San Miguel', 'En la avenida principal', 'foto_11.jpg', 0, '987654331', 2, 1, 11, 11, 1),
('Violencia Doméstica', 'Jirón Comercio 107, Urbanización Miramar', 'Detrás de la iglesia', 'foto_12.jpg', 0, '987654332', 3, 2, 12, 12, 1),
('Robo', 'Calle 2 de Mayo 108, Urbanización Maranga', 'En el callejón', 'foto_13.jpg', 0, '987654333', 1, 3, 13, 13, 0),
('Asalto', 'Av. Escardó 109, Urbanización Pando', 'Frente a la plaza', 'foto_14.jpg', 1, '987654334', 2, 4, 1, 1, 0),
('Accidente de Tránsito', 'Jirón Alfonso Ugarte 110, Urbanización San Miguelito', 'En la intersección', 'foto_15.jpg', 1, '987654335', 3, 5, 2, 2, 0),
('Incendio', 'Calle Mariscal Cáceres 111, Urbanización Parque de las Leyendas', 'En la zona residencial', 'foto_16.jpg', 1, '987654336', 1, 1, 3, 3, 0),
('Emergencia Médica', 'Av. Rafael Escardó 112, Urbanización San Miguel', 'Cerca del parque central', 'foto_17.jpg', 0, '987654337', 2, 2, 4, 4, 1),
('Violencia Doméstica', 'Jirón Puno 113, Urbanización Miramar', 'Cerca de la estación de policía', 'foto_18.jpg', 0, '987654338', 3, 3, 5, 5, 1),
('Robo', 'Calle Arica 114, Urbanización Maranga', 'En la plaza', 'foto_19.jpg', 0, '987654339', 1, 4, 6, 6, 0),
('Asalto', 'Av. Lima 115, Urbanización Pando', 'Cerca del centro comercial', 'foto_20.jpg', 1, '987654340', 2, 5, 7, 7, 0),
('Accidente de Tránsito', 'Jirón Amazonas 116, Urbanización San Miguelito', 'Frente al cine', 'foto_21.jpg', 1, '987654341', 3, 1, 8, 8, 0),
('Incendio', 'Calle Arequipa 117, Urbanización Parque de las Leyendas', 'En el edificio alto', 'foto_22.jpg', 1, '987654342', 1, 2, 9, 9, 0),
('Emergencia Médica', 'Av. Ayacucho 118, Urbanización San Miguel', 'Junto al hospital', 'foto_23.jpg', 0, '987654343', 2, 3, 10, 10, 1),
('Violencia Doméstica', 'Jirón Callao 119, Urbanización Miramar', 'En la casa esquinera', 'foto_24.jpg', 0, '987654344', 3, 4, 11, 11, 1),
('Robo', 'Calle Moquegua 120, Urbanización Maranga', 'Cerca de la escuela', 'foto_25.jpg', 0, '987654345', 1, 5, 12, 12, 0),
('Asalto', 'Av. Cusco 121, Urbanización Pando', 'Frente a la tienda', 'foto_26.jpg', 1, '987654346', 2, 1, 13, 13, 0),
('Accidente de Tránsito', 'Jirón Loreto 122, Urbanización San Miguelito', 'Cerca del parque', 'foto_27.jpg', 1, '987654347', 3, 2, 1, 1, 0),
('Incendio', 'Calle Huancavelica 123, Urbanización Parque de las Leyendas', 'En el barrio viejo', 'foto_28.jpg', 1, '987654348', 1, 3, 2, 2, 0),
('Emergencia Médica', 'Av. Junín 124, Urbanización San Miguel', 'Cerca de la estación de tren', 'foto_29.jpg', 0, '987654349', 2, 4, 3, 3, 1),
('Violencia Doméstica', 'Jirón Tacna 125, Urbanización Miramar', 'En la zona residencial', 'foto_30.jpg', 0, '987654350', 3, 5, 4, 4, 1);


-- -----------------------------------------------------
-- Table `televecinosDB`.`TurnoSerenazgo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`TurnoSerenazgo` (
  `idTurnoSerenazgo` INT NOT NULL AUTO_INCREMENT,
  `turno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTurnoSerenazgo`))
ENGINE = InnoDB;

-- Inserciones para la tabla TurnoSerenazgo
INSERT INTO `televecinosDB`.`TurnoSerenazgo` (`turno`) VALUES
('Diurno'), ('Nocturno');

-- -----------------------------------------------------
-- Table `mtelevecinosDBydb`.`TipoSerenazgo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`TipoSerenazgo` (
  `idTipoSerenazgo` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoSerenazgo`))
ENGINE = InnoDB;
-- Inserciones para la tabla TipoSerenazgo
INSERT INTO `televecinosDB`.`TipoSerenazgo` (`tipo`) VALUES
('Bicicleta'), ('A pie'), ('Canino'), ('Vehiculo');

-- -----------------------------------------------------
-- Table `televecinosDB`.`Serenazgo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `televecinosDB`.`Serenazgo` (
  `idSerenazgo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido` VARCHAR(150) NOT NULL,
  `dni` VARCHAR(150) NOT NULL,
  `direcion` VARCHAR(150) NOT NULL,
  `numTelefono` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `TurnoSerenazgo_idTurnoSerenazgo` INT NOT NULL,
  `TipoSerenazgo_idTipoSerenazgo` INT NOT NULL,
  PRIMARY KEY (`idSerenazgo`),
  INDEX `fk_Serenazgo_TurnoSerenazgo1_idx` (`TurnoSerenazgo_idTurnoSerenazgo` ASC) VISIBLE,
  INDEX `fk_Serenazgo_TipoSerenazgo1_idx` (`TipoSerenazgo_idTipoSerenazgo` ASC) VISIBLE,
  CONSTRAINT `fk_Serenazgo_TurnoSerenazgo1`
    FOREIGN KEY (`TurnoSerenazgo_idTurnoSerenazgo`)
    REFERENCES `televecinosDB`.`TurnoSerenazgo` (`idTurnoSerenazgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serenazgo_TipoSerenazgo1`
    FOREIGN KEY (`TipoSerenazgo_idTipoSerenazgo`)
    REFERENCES `televecinosDB`.`TipoSerenazgo` (`idTipoSerenazgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- datos de serenazgos------
INSERT INTO `televecinosDB`.`Serenazgo` (`nombre`, `apellido`, `dni`, `direccion`, `numTelefono`, `fechaNacimiento`, `TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`) VALUES
('Juan', 'González', '12345678', 'Calle Alfonso Ugarte 127, San Miguel', '912345678', '1990-01-01', 1, 1),
('María', 'Pérez', '23456789', 'Avenida Patriotas 234, San Isidro', '923456789', '1992-02-02', 2, 2),
('Carlos', 'Díaz', '34567890', 'Jirón Amazonas 341, Miraflores', '934567890', '1994-03-03', 1, 3),
('Laura', 'Sánchez', '45678901', 'Calle Arica 452, Barranco', '945678901', '1996-04-04', 2, 4),
('Pedro', 'Martínez', '56789012', 'Avenida Ayacucho 563, San Borja', '956789012', '1998-05-05', 1, 1),
('Ana', 'Rodríguez', '67890123', 'Jirón Chancay 674, La Molina', '967890123', '2000-06-06', 2, 2),
('Luis', 'Ramírez', '78901234', 'Calle Los Jazmines 785, Surco', '978901234', '1989-07-07', 1, 3),
('Elena', 'Torres', '89012345', 'Avenida La Marina 896, San Miguel', '989012345', '1991-08-08', 2, 4),
('Fernando', 'Cruz', '90123456', 'Jirón Puno 907, Magdalena', '999123456', '1993-09-09', 1, 1),
('Gloria', 'Flores', '01234567', 'Calle Junín 1018, Pueblo Libre', '911234567', '1995-10-10', 2, 2),
('Ricardo', 'Salazar', '12345679', 'Avenida Bertoloto 1129, San Miguel', '922345678', '1997-11-11', 1, 3),
('Paola', 'Guzmán', '23456780', 'Jirón Tumbes 1240, Jesús María', '933456789', '1999-12-12', 2, 4),
('Miguel', 'Vargas', '34567891', 'Calle Libertad 1351, Breña', '944567890', '1988-01-13', 1, 1),
('Claudia', 'Mendoza', '45678902', 'Avenida La Marina 1462, San Miguel', '955678901', '1990-02-14', 2, 2),
('Alberto', 'Rojas', '56789013', 'Jirón Bolognesi 1573, Lince', '966789012', '1992-03-15', 1, 3),
('Patricia', 'Aguilar', '67890124', 'Calle Tacna 1684, San Luis', '977890123', '1994-04-16', 2, 4),
('Hugo', 'Paredes', '78901235', 'Avenida Faucett 1795, Callao', '988901234', '1996-05-17', 1, 1),
('Gabriela', 'Campos', '89012346', 'Jirón Inclán 1806, Chorrillos', '999012345', '1998-06-18', 2, 2),
('Oscar', 'Castañeda', '90123457', 'Calle Olaya 1917, San Juan de Lurigancho', '911123456', '2000-07-19', 1, 3),
('Verónica', 'Peña', '01234568', 'Avenida Precursores 2028, San Miguel', '922234567', '1987-08-20', 2, 4),
('Jaime', 'Reyes', '12345689', 'Jirón Manco Cápac 2139, Cercado de Lima', '933345678', '1989-09-21', 1, 1),
('Lucía', 'Ortega', '23456790', 'Calle Independencia 2250, Comas', '944456789', '1991-10-22', 2, 2),
('Diego', 'Espinoza', '34567890', 'Avenida Bertoloto 2361, Los Olivos', '955567890', '1993-11-23', 1, 3),
('Raúl', 'Ruiz', '45678901', 'Jirón Chancay 2472, Villa María del Triunfo', '966678901', '1995-12-24', 2, 4);





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
