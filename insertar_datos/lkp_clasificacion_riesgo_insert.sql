INSERT INTO [Financiera].[lkp_clasificacion_riesgo] (vch_codigo_clasificacion, vch_descripcion, dbl_provision_minima, int_dias_atraso_min, int_dias_atraso_max) VALUES
('NOR', 'Normal', 0.01, 0, 8),
('CPP', 'Con Problemas Potenciales', 0.05, 9, 30),
('DEF', 'Deficiente', 0.25, 31, 60),
('DUD', 'Dudoso', 0.5, 61, 120),
('PER', 'Pérdida', 1.0, 121, 9999);