
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
('Robo', '2024-01-01 12:00:00', 'Av. La Marina 1234',1, 'Cerca de la Plaza San Miguel', 'foto_1.jpg', 0, '987654321', 1, 1, 1, 1, 1, 0),
('Asalto', '2024-01-02 13:00:00', 'Av. Universitaria 5678',3, 'Frente al Centro Comercial Plaza San Miguel', 'foto_2.jpg', 1, '987654322', 2, 2, 2, 2, 2, 0),
('Accidente de Tránsito', '2024-01-03 14:00:00', 'Jirón Pescadores 123',5, 'Intersección con Av. La Marina', 'foto_3.jpg', 1, '987654323', 3, 3, 3, 3, 3, 0),
('Incendio', '2024-01-04 15:00:00', 'Calle Bolognesi 456',7, 'Edificio Residencial', 'foto_4.jpg', 1, '987654324', 1, 4, 4, 4, 4, 0),
('Emergencia Médica', '2024-01-05 16:00:00', 'Av. Bertolotto 789',9, 'Cerca del Hospital San José', 'foto_5.jpg', 0, '987654325', 2, 1, 5, 5, 5, 1),
('Violencia Doméstica', '2024-01-06 17:00:00', 'Jirón Mantaro 101',11, 'Vivienda Unifamiliar', 'foto_6.jpg', 0, '987654326', 3, 1, 2, 6, 6, 1),
('Robo', '2024-01-07 18:00:00', 'Calle Salaverry 102',12, 'En la esquina', 'foto_7.jpg', 0, '987654327', 1, 3,2, 7, 7, 0),
('Asalto', '2024-01-08 19:00:00', 'Av. Faucett 103',10, 'Cerca de la escuela', 'foto_8.jpg', 1, '987654328', 2, 4,3, 8, 8, 0);


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
('Luis', 'García', '12345678', 'Calle Alfonso Ugarte 127, Rafael Escardó', 'luis.garcia@example.com', 'password1', 1, 1, 'avatar', 1, 1, 0),
('César', 'Ramírez', '22345678', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', 'password2', 2, 1, 'avatar', 2, 2, 0),
('María', 'Fernández', '32345678', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', 'password3', 1, 1, 'avatar', 3, 1, 0),
('Ana', 'Rodríguez', '42345678', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', 'password4', 2, 1, 'avatar', 4, 2, 0),
('Pedro', 'Martínez', '52345678', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', 'password5', 1, 1, 'avatar', 5, 1, 0),
('Juan', 'López', '62345678', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', 'password6',  2, 1, 'avatar', 6, 2, 0),
('Carlos', 'González', '72345678', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', 'password7',  1, 1, 'avatar', 7, 1, 0),
('Sofía', 'Pérez', '82345678', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', 'password8',  2, 1, 'avatar', 8, 2, 0),
('Lucía', 'Díaz', '92345678', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', 'password9', 1, 1, 'avatar', 9, 1, 0),
('Miguel', 'Hernández', '10345678', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', 'password10', 2, 1, 'avatar', 10, 2, 0),
('Elena', 'Jiménez', '11345678', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', 'password11', 1, 1, 'avatar', 11, 1, 0),
('Valeria', 'Ruiz', '12345679', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', 'password12', 2, 1, 'avatar', 12, 2, 0),
('Diego', 'Morales', '13345678', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', 'password13',  1, 1, 'avatar', 1, 1, 0),
('Andrea', 'Ortiz', '14345678', 'Avenida La Marina 1462, José de La Riva Agüero', 'andrea.ortiz@example.com', 'password14',  2, 1, 'avatar', 2, 2, 0),
('Fernando', 'Castro', '15345678', 'Jirón Bolognesi 1573, Juan XXIII', 'fernando.castro@example.com', 'password15', 1, 1, 'avatar', 3, 1, 0),
('Gabriela', 'Torres', '16345678', 'Calle Tacna 1684, Libertad', 'gabriela.torres@example.com', 'password16',  2, 1, 'avatar', 4, 2, 0),
('Sergio', 'Flores', '17345678', 'Avenida Faucett 1795, Los Jardines de La Marina', 'sergio.flores@example.com', 'password17', 1, 1, 'avatar', 5, 1, 0),
('Isabel', 'Mendoza', '18345678', 'Jirón Inclán 1806, Las Leyendas', 'isabel.mendoza@example.com', 'password18',  2, 1, 'avatar', 6, 2, 0),
('Alejandro', 'Romero', '19345678', 'Calle Olaya 1917, Las Torres San Miguelito', 'alejandro.romero@example.com', 'password19', 1, 1, 'avatar', 7, 1, 0),
('Patricia', 'Vega', '20345678', 'Avenida Precursores 2028, Elmer Faucett', 'patricia.vega@example.com', 'password20',  2, 1, 'avatar', 8, 2, 0),
('Ricardo', 'Soto', '21345678', 'Jirón Manco Cápac 2139, Maranga', 'ricardo.soto@example.com', 'password21',  1, 1, 'avatar', 9, 1, 0),
('Paula', 'Silva', '22345678', 'Calle Independencia 2250, Pando', 'paula.silva@example.com', 'password22',  2, 1, 'avatar', 10, 2, 0),
('Hugo', 'Rojas', '23345678', 'Avenida Bertoloto 2361, Parques de La Huaca', 'hugo.rojas@example.com', 'password23',  1, 1, 'avatar', 11, 1, 0),
('Verónica', 'Peña', '24345678', 'Jirón Chancay 2472, Otro', 'veronica.pena@example.com', 'password24', 2, 1, 'avatar', 12, 2, 0),
('Oscar', 'Cruz', '25345678', 'Calle Grau 2583, Rafael Escardó', 'oscar.cruz@example.com', 'password25',  1, 1, 'avatar', 1, 1, 0),
('Javier', 'Reyes', '26345678', 'Avenida Los Patriotas 2694, José de La Riva Agüero', 'javier.reyes@example.com', 'password26',  2, 1, 'avatar', 2, 2, 0),
('Natalia', 'Campos', '27345678', 'Jirón Sucre 2705, Juan XXIII', 'natalia.campos@example.com', 'password27', 1, 1, 'avatar', 3, 1, 0),
('Cristina', 'Ramos', '28345678', 'Calle Salaverry 2816, Libertad', 'cristina.ramos@example.com', 'password28', 2, 1, 'avatar', 4, 2, 0),
('Pablo', 'Aguilar', '29345678', 'Avenida La Marina 2927, Los Jardines de La Marina', 'pablo.aguilar@example.com', 'password29',  1, 1, 'avatar', 5, 1, 0),
('Lorena', 'Guzmán', '30345678', 'Jirón Manco Cápac 3038, Las Leyendas', 'lorena.guzman@example.com', 'password30',  2, 1, 'avatar', 6, 2, 0),
('Luis', 'García', '12345670', 'Calle Alfonso Ugarte 127, Rafael Escardó', 'luis.garcia@example.com', 'password1',  1, 1, 'avatar', 1, 1, 0),
('César', 'Ramírez', '22345670', 'Avenida Patriotas 234, José de La Riva Agüero', 'cesar.ramirez@example.com', 'password2', 2, 1, 'avatar', 2, 2, 0),
('María', 'Fernández', '32345670', 'Jirón Amazonas 341, Juan XXIII', 'maria.fernandez@example.com', 'password3',  1, 1, 'avatar', 3, 1, 0),
('Ana', 'Rodríguez', '42345670', 'Calle Arica 452, Libertad', 'ana.rodriguez@example.com', 'password4',2, 1, 'avatar', 4, 2, 0),
('Pedro', 'Martínez', '52345670', 'Avenida Ayacucho 563, Los Jardines de La Marina', 'pedro.martinez@example.com', 'password5', 1, 1, 'avatar', 5, 1, 0),
('Juan', 'López', '62345670', 'Jirón Chancay 674, Las Leyendas', 'juan.lopez@example.com', 'password6', 2, 1, 'avatar', 6, 2, 0),
('Carlos', 'González', '72345670', 'Calle Castilla 785, Las Torres San Miguelito', 'carlos.gonzalez@example.com', 'password7', 1, 1, 'avatar', 7, 1, 0),
('Sofía', 'Pérez', '82345670', 'Avenida de Los Precursores 896, Elmer Faucett', 'sofia.perez@example.com', 'password8',  2, 1, 'avatar', 8, 2, 0),
('Lucía', 'Díaz', '92345670', 'Jirón Puno 907, Maranga', 'lucia.diaz@example.com', 'password9',  1, 1, 'avatar', 9, 1, 0),
('Miguel', 'Hernández', '10345670', 'Calle Junín 1018, Pando', 'miguel.hernandez@example.com', 'password10',  2, 1, 'avatar', 10, 2, 0),
('Elena', 'Jiménez', '11345670', 'Avenida Bertoloto 1129, Parques de La Huaca', 'elena.jimenez@example.com', 'password11',  1, 1, 'avatar', 11, 1, 0),
('Valeria', 'Ruiz', '12345671', 'Jirón Tumbes 1240, Otro', 'valeria.ruiz@example.com', 'password12', 2, 1, 'avatar', 12, 2, 0),
('Diego', 'Morales', '13345670', 'Calle Libertad 1351, Rafael Escardó', 'diego.morales@example.com', 'password13', 1, 1, 'avatar', 1, 1, 0),
('Andrea', 'Ortiz', '14345670', 'Avenida La Marina 1462, José de La Riva Agüero', 'andrea.ortiz@example.com', 'password14', 2, 1, 'avatar', 2, 2, 0),
('Fernando', 'Castro', '15345670', 'Jirón Bolognesi 1573, Juan XXIII', 'fernando.castro@example.com', 'password15',1, 1, 'avatar', 3, 1, 0),
('Gabriela', 'Torres', '16345670', 'Calle Tacna 1684, Libertad', 'gabriela.torres@example.com', 'password16', 2, 1, 'avatar', 4, 2, 0),
('Sergio', 'Flores', '17345670', 'Avenida Faucett 1795, Los Jardines de La Marina', 'sergio.flores@example.com', 'password17', 1, 1, 'avatar', 5, 1, 0),
('Isabel', 'Mendoza', '18345670', 'Jirón Inclán 1806, Las Leyendas', 'isabel.mendoza@example.com', 'password18', 2, 1, 'avatar', 6, 2, 0),
('Alejandro', 'Romero', '19345670', 'Calle Olaya 1917, Las Torres San Miguelito', 'alejandro.romero@example.com', 'password19',  1, 1, 'avatar', 7, 1, 0),
('Patricia', 'Vega', '20345670', 'Avenida Precursores 2028, Elmer Faucett', 'patricia.vega@example.com', 'password20',  2, 1, 'avatar', 8, 2, 0),
('Ricardo', 'Soto', '21345670', 'Jirón Manco Cápac 2139, Maranga', 'ricardo.soto@example.com', 'password21',  1, 1, 'avatar', 9, 1, 0),
('Paula', 'Silva', '22345670', 'Calle Independencia 2250, Pando', 'paula.silva@example.com', 'password22',  2, 1, 'avatar', 10, 2, 0),
('Hugo', 'Rojas', '23345670', 'Avenida Bertoloto 2361, Parques de La Huaca', 'hugo.rojas@example.com', 'password23',  1, 1, 'avatar', 11, 1, 0),
('Verónica', 'Peña', '24345670', 'Jirón Chancay 2472, Otro', 'veronica.pena@example.com', 'password24', 2, 1, 'avatar', 12, 2, 0),
('Oscar', 'Cruz', '25345670', 'Calle Grau 2583, Rafael Escardó', 'oscar.cruz@example.com', 'password25', 1, 1, 'avatar', 1, 1, 0),
('Javier', 'Reyes', '26345670', 'Avenida Los Patriotas 2694, José de La Riva Agüero', 'javier.reyes@example.com', 'password26',  2, 1, 'avatar', 2, 2, 0),
('Natalia', 'Campos', '27345670', 'Jirón Sucre 2705, Juan XXIII', 'natalia.campos@example.com', 'password27',1, 1, 'avatar', 3, 1, 0),
('Cristina', 'Ramos', '28345670', 'Calle Salaverry 2816, Libertad', 'cristina.ramos@example.com', 'password28', 2, 1, 'avatar', 4, 2, 0),
('Pablo', 'Aguilar', '29345670', 'Avenida La Marina 2927, Los Jardines de La Marina', 'pablo.aguilar@example.com', 'password29',1, 1, 'avatar', 5, 1, 0),
('Lorena', 'Guzmán', '30345670', 'Jirón Manco Cápac 3038, Las Leyendas', 'lorena.guzman@example.com', 'password30', 2, 1, 'avatar', 6, 2, 0);



INSERT INTO `televecinosDB`.`Serenazgo` (`numTelefono`, `fechaNacimiento`, `TurnoSerenazgo_idTurnoSerenazgo`, `TipoSerenazgo_idTipoSerenazgo`,`usuario_idUsuario`) VALUES
( '912345678', '1990-01-01', 1, 1,61),
( '923456789', '1992-02-02', 2, 2,62),
( '934567890', '1994-03-03', 1, 3,63);


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






