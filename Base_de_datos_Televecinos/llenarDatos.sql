
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
(2, 'Emergencia Médica'), 
(3, 'Infraestructura y Servicios Públicos'), 
(4, 'Otro');





INSERT INTO `televecinosDB`.`EventFrecuencia` (`tipoFrecuencia`) VALUES
('Semanal'),
('Dos veces por semana');


INSERT INTO `televecinosDB`.`TurnoSerenazgo` (`idTurnoSerenazgo`,`turno`) VALUES
(1,'Diurno'), (2,'Nocturno');
INSERT INTO `televecinosDB`.`TipoSerenazgo` (`idTipoSerenazgo`,`tipo`) VALUES
(1,'Bicicleta'), (2,'A pie'), (3,'Canino'), (4,'Vehiculo');

-- Ingreso de coordinadoras
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
('César', 'Ramírez', '22345678', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', SHA2('password2', 256), 1, 1, 'avatar', 2, 3, 0),
('María', 'Fernández', '32345678', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', SHA2('password3', 256), 1, 1, 'avatar', 3, 3, 0),
('Ana', 'Rodríguez', '42345678', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', SHA2('password4', 256), 1, 1, 'avatar', 4, 3, 0),
('Pedro', 'Martínez', '52345678', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', SHA2('password5', 256), 2, 1, 'avatar', 5, 3, 0),
('Juan', 'López', '62345678', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', SHA2('password6', 256), 2, 1, 'avatar', 6, 3, 0);

-- Ingreso de vecinos
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
('Carlos', 'González', '72345678', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', SHA2('password7', 256), 'avatar', 1, 2, 0),
('Sofía', 'Pérez', '82345678', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', SHA2('password8', 256), 'avatar', 1, 2, 0),
('Lucía', 'Díaz', '92345678', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', SHA2('password9', 256), 'avatar', 1, 2, 0),
('Miguel', 'Hernández', '10345678', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', SHA2('password10', 256), 'avatar', 1, 2, 0),
('Elena', 'Jiménez', '11345678', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', SHA2('password11', 256), 'avatar', 1, 2, 0),
('Valeria', 'Ruiz', '12345679', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', SHA2('password12', 256), 'avatar', 1, 1, 0),
('Diego', 'Morales', '13345678', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', SHA2('password13', 256), 'avatar', 1, 1, 0);

-- Ingreso adicional
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
('Juan', 'González', '12345678', 'Calle Alfonso Ugarte 127', 'luis.garcia@example.com', SHA2('password1', 256), 1, 4, 0),
('María', 'Pérez', '23456789', 'Avenida Patriotas 234', 'maria.perez@example.com', SHA2('password2', 256), 1, 4, 0),
('Carlos', 'Díaz', '34567890', 'Jirón Amazonas 341', 'Carlos.Díaz@example.com', SHA2('password3', 256), 1, 4, 0);


INSERT INTO `televecinosDB`.`Serenazgo` (`numTelefono`, `fechaNacimiento`, `TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`,`usuario_idUsuario`) VALUES
( '912345678', '1990-01-01', 1, 1,13),
( '923456789', '1992-02-02', 2, 2,14),
( '934567890', '1994-03-03', 1, 3,15);

-- Inserciones para la tabla Eventos (Culturales)
INSERT INTO `televecinosDB`.`eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`, `hora_inicio`, `hora_fin`, `diasEvento`) 
VALUES
('Conferencia Cultural sobre Historia del Arte', 'Una conferencia detallada sobre la evolución del arte a lo largo de los siglos', 'Museo Larco', 1, '2024-06-01', '2024-06-01', 100, 100, 'imagen1.jpg', 'Proyector, Apuntes', 2, 1, 1, 1, '10:00:00', '12:00:00', 'Lunes'),
('Seminario de Arte Moderno', 'Exploración de las tendencias del arte moderno', 'Casa de la Cultura', 2, '2024-06-02', '2024-06-02', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 2, 1, 2, '14:00:00', '16:00:00', 'Martes-Jueves'),
('Taller de Escritura Creativa', 'Desarrolla tus habilidades en escritura creativa', 'Biblioteca Municipal de San Miguel', 3, '2024-06-03', '2024-06-03', 30, 30, 'default.jpg', 'Cuadernos, Plumas', 1, 1, 1, 3, '09:00:00', '11:00:00', 'Jueves'),
('Webinar de Literatura Clásica', 'Discusión en línea sobre obras literarias clásicas', 'Online', 1, '2024-06-04', '2024-06-04', 200, 200, 'default.jpg', 'Computadora, Internet', 3, 1, 1, 4, '17:00:00', '18:30:00', 'Viernes'),
('Foro de Filosofía Contemporánea', 'Debate sobre temas de filosofía contemporánea', 'Centro Cultural de San Miguel', 2, '2024-06-05', '2024-06-05', 40, 40, 'default.jpg', 'Apuntes, Libros', 1, 1, 1, 5, '10:00:00', '12:00:00', 'Lunes'),
('Mesa Redonda de Historia Mundial', 'Discusión sobre eventos históricos importantes', 'Auditorio Municipal', 3, '2024-06-06', '2024-06-06', 60, 60, 'default.jpg', 'Micrófonos, Proyector', 3, 1, 1, 6, '14:00:00', '16:00:00', 'Martes');

-- Inserciones para la tabla Eventos (Deportivos)
INSERT INTO `televecinosDB`.`eventos` 
(`nombre`, `descripcion`, `lugar`, `Coordinador_idUsuario`, `fecha_inicio`, `fecha_fin`, `cantidadVacantes`, `cantDisponibles`, `foto`, `listaMateriales`, `EventEstados_idEventEstados`, `EventFrecuencia_idEventFrecuencia`, `TipoEvento_idTipoEvento`, `ProfesoresEvento_idProfesoresEvento`, `hora_inicio`, `hora_fin`, `diasEvento`) 
VALUES
('Conferencia Deportiva sobre Fútbol', 'Una conferencia sobre estrategias y tácticas en fútbol', 'Estadio San Miguel', 4, '2024-06-01', '2024-06-01', 100, 100, 'default.jpg', 'Proyector, Apuntes', 2, 2, 2, 11, '15:00:00', '17:00:00', 'Lunes-Miércoles'),
('Seminario de Nutrición Deportiva', 'Discusión sobre la importancia de la nutrición en el deporte', 'Casa del Deporte', 4, '2024-06-02', '2024-06-02', 50, 50, 'default.jpg', 'Bloc de notas, Lápices', 3, 2, 2, 12, '10:00:00', '12:00:00', 'Martes-Jueves'),
('Taller de Entrenamiento Funcional', 'Entrenamiento intensivo para mejorar la condición física', 'Gimnasio Municipal', 5, '2024-06-03', '2024-06-03', 30, 30, 'default.jpg', 'Ropa deportiva, Agua', 1, 2, 2, 13, '08:00:00', '10:00:00', 'Lunes-Miércoles'),
('Webinar de Psicología Deportiva', 'Conferencia en línea sobre la psicología aplicada al deporte', 'Online', 5, '2024-06-04', '2024-06-04', 200, 200, 'default.jpg', 'Computadora, Internet', 1, 2, 2, 14, '17:00:00', '18:30:00', 'Martes-Jueves');

INSERT INTO `televecinosDB`.`Incidencias` (
  `nombreIncidencia`, 
  `fecha`, 
  `lugarExacto`, 
  `urbanizacion_idUrbanizacion`,
  `referencia`, 
  `foto`, 
  `ambulancia`, 
  `numeroContacto`, 
  `CriticidadIncidencia_idCriticidadIncidencia`, 
  `TipoIncidencia_idTipoIncidencia`, 
  `EstadosIncidencia_idEstadosIncidencia`, 
  `Serenazgo_idSerenazgo`, 
  `Usuario_idUsuario`, 
  `incidenciaPersonal`
) VALUES
('Robo', '2024-01-01 12:00:00', 'Av. La Marina 1234',1, 'Cerca de la Plaza San Miguel', 'foto_1.jpg', 0, '987654321', 1, 1, 1, 1, 13, 0),
('Asalto', '2024-01-02 13:00:00', 'Av. Universitaria 5678',3, 'Frente al Centro Comercial Plaza San Miguel', 'foto_2.jpg', 1, '987654322', 2, 2, 2, 2, 13, 0),
('Accidente de Tránsito', '2024-01-03 14:00:00', 'Jirón Pescadores 123',5, 'Intersección con Av. La Marina', 'foto_3.jpg', 1, '987654323', 3, 3, 3, 3, 13, 0),
('Incendio', '2024-01-04 15:00:00', 'Calle Bolognesi 456',7, 'Edificio Residencial', 'foto_4.jpg', 1, '987654324', 1, 4, 4, 3, 14, 0),
('Emergencia Médica', '2024-01-05 16:00:00', 'Av. Bertolotto 789',9, 'Cerca del Hospital San José', 'foto_5.jpg', 0, '987654325', 2, 1, 5, 2, 15, 1),
('Violencia Doméstica', '2024-01-06 17:00:00', 'Jirón Mantaro 101',11, 'Vivienda Unifamiliar', 'foto_6.jpg', 0, '987654326', 3, 2, 1, 1, 15, 1),
('Robo', '2024-01-07 18:00:00', 'Calle Salaverry 102',12, 'En la esquina', 'foto_7.jpg', 0, '987654327', 1, 3,2, 2, 13, 0),
('Asalto', '2024-01-08 19:00:00', 'Av. Faucett 103',10, 'Cerca de la escuela', 'foto_8.jpg', 1, '987654328', 2, 4,3, 3, 14, 0),
('Accidente de Tránsito', '2024-01-09 14:00:00', 'Jirón Pescadores 123',8, 'Intersección con Av. La Marina', 'foto_3.jpg', 1, '987654323', 3, 1, 1, 3, 13, 0),
('Incendio', '2024-01-10 15:00:00', 'Calle Bolognesi 456',6, 'Edificio Residencial', 'foto_4.jpg', 1, '987654324', 1, 2, 2, 3, 14, 0),
('Emergencia Médica', '2024-01-10 16:00:00', 'Av. Bertolotto 789',4, 'Cerca del Hospital San José', 'foto_5.jpg', 0, '987654325', 2, 1, 3, 2, 15, 1),
('Violencia Doméstica', '2024-01-11 17:00:00', 'Jirón Mantaro 101',2, 'Vivienda Unifamiliar', 'foto_6.jpg', 0, '987654326', 3, 3, 2, 1, 15, 1);
