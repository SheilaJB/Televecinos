
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

INSERT INTO `televecinosDB`.`Rol` (`idRol`, `tipoRol`) VALUES
('1', 'Solicitante'), 
('2', 'Vecino'), 
('3', 'Coordinadora'), 
('4', 'Serenazgo'), 
('5', 'Administrador');

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

INSERT INTO `televecinosDB`.`PreguntasFrecuentes` (`pregunta`, `repuesta`, `fechaModificacion`) VALUES
('¿Cuál es el horario de atención?', 'Nuestro horario de atención es de 9am a 6pm.', '2024-01-02 00:00:00.000000'),
('¿Dónde están ubicados?', 'Estamos ubicados en San Miguel, Lima.', '2024-01-03 00:00:00.000000'),
('¿Cómo puedo contactar soporte?', 'Puede contactar soporte vía email o teléfono.', '2024-01-04 00:00:00.000000'),
('¿Dónde puedo ver los eventos próximos?', 'Puede ver los eventos próximos en nuestra sección de eventos.', '2024-01-09 00:00:00.000000'),
('¿Cómo puedo recuperar mi contraseña?', 'Puede recuperar su contraseña desde la página de inicio de sesión.', '2024-01-11 00:00:00.000000'),
('¿Puedo asistir a eventos sin registrarme?', 'No, es necesario registrarse para asistir a los eventos.', '2024-01-15 00:00:00.000000');


INSERT INTO `televecinosDB`.`CriticidadIncidencia` (`criticidad`) VALUES
('Baja'), ('Media'), ('Alta');

INSERT INTO `televecinosDB`.`EstadosIncidencia` (`idEstadosIncidencia`, `estado`) VALUES
(1,'Pendiente'), (2,'En Curso'), (3,'Cancelado'), (4,'Rechazado'), (5,'Procesado');

INSERT INTO `televecinosDB`.`TipoCoordinador` (`nombre`) VALUES
('Coordinadora de Cultura'), ('Coordinadora de Deportes');




INSERT INTO `televecinosDB`.`TipoEvento` (`tipo`) VALUES
('Evento Cultural'),
('Evento Deportivo');

INSERT INTO `televecinosDB`.`EventEstados` (`estadosEvento`) VALUES
('Disponible'), ('En curso'), ('Finalizado');

INSERT INTO `televecinosDB`.`tipoIncidencia` (`idTipoIncidencia`, `TipoIncidencia`) VALUES
(1, 'Seguridad Pública'), 
(2, 'Emergencia pública'), 
(3, 'Infraestructura y Servicios Publicos'), 
(4, 'Otro');





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
('Dos veces por semana', '2024-04-29', '2024-05-02');


INSERT INTO `televecinosDB`.`TurnoSerenazgo` (`idTurnoSerenazgo`,`turno`) VALUES
(1,'Diurno'), (2,'Nocturno');
INSERT INTO `televecinosDB`.`TipoSerenazgo` (`idTipoSerenazgo`,`tipo`) VALUES
(1,'Bicicleta'), (2,'A pie'), (3,'Canino'), (4,'Vehiculo');

-- ingreso de coordinadoras
INSERT INTO `televecinosDB`.`Usuario` (
  `nombre`, 
  `apellido`, 
  `dni`, 
  `direccion`, 
  `correo`, 
  `contrasena`, 
  `TipoCoordinador_idTipoCoordinador`, 
  `asistencia`, 
  `avatar`, 
  `PreguntasFrecuentes_idtable2`, 
  `Rol_idRol`, 
  `isBan`
) VALUES
('César', 'Ramírez', '22345678', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', 'password2', 1, 1, 'avatar', 2, 3, 0),
('María', 'Fernández', '32345678', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', 'password3', 1, 1, 'avatar', 3, 3, 0),
('Ana', 'Rodríguez', '42345678', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', 'password4', 1, 1, 'avatar', 4, 3, 0),
('Pedro', 'Martínez', '52345678', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', 'password5', 2, 1, 'avatar', 5, 3, 0),
('Juan', 'López', '62345678', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', 'password6',  2, 1, 'avatar', 6, 3, 0);
-- ingreso de vecinos
INSERT INTO `televecinosDB`.`Usuario` (
  `nombre`, 
  `apellido`, 
  `dni`, 
  `direccion`, 
  `correo`, 
  `contrasena`, 
  `avatar`, 
  `PreguntasFrecuentes_idtable2`, 
  `Rol_idRol`, 
  `isBan`
) VALUES
('Carlos', 'González', '72345678', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', 'password7',  'avatar',1, 2, 0),
('Sofía', 'Pérez', '82345678', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', 'password8', 'avatar', 1, 2, 0),
('Lucía', 'Díaz', '92345678', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', 'password9', 'avatar', 1, 2, 0),
('Miguel', 'Hernández', '10345678', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', 'password10', 'avatar', 1, 2, 0),
('Elena', 'Jiménez', '11345678', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', 'password11','avatar', 1, 2, 0),
('Valeria', 'Ruiz', '12345679', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', 'password12','avatar', 1, 1, 0),
('Diego', 'Morales', '13345678', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', 'password13', 'avatar', 1, 1, 0);




INSERT INTO `televecinosDB`.`Usuario` (
  `nombre`, 
  `apellido`, 
  `dni`, 
  `direccion`, 
  `correo`, 
  `contrasena`, 
  `PreguntasFrecuentes_idtable2`, 
  `Rol_idRol`, 
  `isBan`
) VALUES
('Juan', 'González', '12345678', 'Calle Alfonso Ugarte 127', 'luis.garcia@example.com', 'password1', 1, 4, 0),
('María', 'Pérez', '23456789', 'Avenida Patriotas 234', 'maria.perez@example.com', 'password2', 1, 4, 0),
('Carlos', 'Díaz', '34567890', 'Jirón Amazonas 341', 'Carlos.Díaz@example.com', 'password3', 1, 4, 0);

INSERT INTO `televecinosDB`.`Serenazgo` (`numTelefono`, `fechaNacimiento`, `TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`,`usuario_idUsuario`) VALUES
( '912345678', '1990-01-01', 1, 1,13),
( '923456789', '1992-02-02', 2, 2,14),
( '934567890', '1994-03-03', 1, 3,15);

INSERT INTO `televecinosDB`.`Eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`) VALUES
('Conferencia Cultural sobre Historia del Arte', 'Una conferencia detallada sobre la evolución del arte a lo largo de los siglos', 'Museo Larco', 1, '2024-06-01 10:00:00', '2024-06-01 12:00:00', 100, 100, 'imagen1.jpg', 'Proyector, Apuntes', 2, 1, 1, 1),
('Seminario de Arte Moderno', 'Exploración de las tendencias del arte moderno', 'Casa de la Cultura', 2, '2024-06-02 14:00:00', '2024-06-02 16:00:00', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 2, 1, 2),
('Taller de Escritura Creativa', 'Desarrolla tus habilidades en escritura creativa', 'Biblioteca Municipal de San Miguel', 3, '2024-06-03 09:00:00', '2024-06-03 11:00:00', 30, 30, 'default.jpg', 'Cuadernos, Plumas', 1, 1, 1, 3),
('Webinar de Literatura Clásica', 'Discusión en línea sobre obras literarias clásicas', 'Online', 1, '2024-06-04 17:00:00', '2024-06-04 18:30:00', 200, 200, 'default.jpg', 'Computadora, Internet', 3, 1, 1, 4),
('Foro de Filosofía Contemporánea', 'Debate sobre temas de filosofía contemporánea', 'Centro Cultural de San Miguel',2, '2024-06-05 10:00:00', '2024-06-05 12:00:00', 40, 40, 'default.jpg', 'Apuntes, Libros', 1, 1, 1, 5),
('Mesa Redonda de Historia Mundial', 'Discusión sobre eventos históricos importantes', 'Auditorio Municipal', 3, '2024-06-06 14:00:00', '2024-06-06 16:00:00', 60, 60, 'default.jpg', 'Micrófonos, Proyector', 3, 1, 1, 6);

-- Inserciones para la tabla Eventos (Eventos Deportivos)
INSERT INTO `televecinosDB`.`Eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`) VALUES
('Conferencia Deportiva sobre Fútbol', 'Una conferencia sobre estrategias y tácticas en fútbol', 'Estadio San Miguel',4, '2024-06-01 15:00:00', '2024-06-01 17:00:00', 100, 100, 'default.jpg', 'Proyector, Apuntes', 2, 1, 2, 11),
('Seminario de Nutrición Deportiva', 'Discusión sobre la importancia de la nutrición en el deporte', 'Casa del Deporte', 4, '2024-06-02 10:00:00', '2024-06-02 12:00:00', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 1, 2, 12),
('Taller de Entrenamiento Funcional', 'Entrenamiento intensivo para mejorar la condición física', 'Gimnasio Municipal', 5, '2024-06-03 08:00:00', '2024-06-03 10:00:00', 30, 30, 'default.jpg', 'Ropa deportiva, Agua', 1, 1, 2, 13),
('Webinar de Psicología Deportiva', 'Conferencia en línea sobre la psicología aplicada al deporte', 'Online', 5, '2024-06-04 17:00:00', '2024-06-04 18:30:00', 200, 200, 'default.jpg', 'Computadora, Internet', 1, 1, 2, 14);










