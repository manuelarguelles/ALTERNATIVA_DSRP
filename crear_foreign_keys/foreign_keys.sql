-- =============================================
-- Base de Datos CLASES_DSRP - Esquema Financiera
-- Creación de Foreign Keys entre tablas
-- =============================================

USE [CLASES_DSRP]
GO

-- =============================================
-- FOREIGN KEYS PARA TABLAS DE DIMENSIONES
-- =============================================

-- dim_empleados -> dim_sucursales
ALTER TABLE [Financiera].[dim_empleados]
ADD CONSTRAINT FK_dim_empleados_dim_sucursales
FOREIGN KEY (int_id_sucursal) REFERENCES [Financiera].[dim_sucursales](int_id_sucursal);
GO

-- =============================================
-- FOREIGN KEYS PARA TABLAS DE HECHOS
-- =============================================

-- fct_creditos -> dim_clientes
ALTER TABLE [Financiera].[fct_creditos]
ADD CONSTRAINT FK_fct_creditos_dim_clientes
FOREIGN KEY (int_id_cliente) REFERENCES [Financiera].[dim_clientes](int_id_cliente);
GO

-- fct_creditos -> dim_productos
ALTER TABLE [Financiera].[fct_creditos]
ADD CONSTRAINT FK_fct_creditos_dim_productos
FOREIGN KEY (int_id_producto) REFERENCES [Financiera].[dim_productos](int_id_producto);
GO

-- fct_creditos -> dim_sucursales
ALTER TABLE [Financiera].[fct_creditos]
ADD CONSTRAINT FK_fct_creditos_dim_sucursales
FOREIGN KEY (int_id_sucursal) REFERENCES [Financiera].[dim_sucursales](int_id_sucursal);
GO

-- fct_creditos -> dim_empleados
ALTER TABLE [Financiera].[fct_creditos]
ADD CONSTRAINT FK_fct_creditos_dim_empleados
FOREIGN KEY (int_id_empleado) REFERENCES [Financiera].[dim_empleados](int_id_empleado);
GO

-- fct_pagos -> fct_creditos
ALTER TABLE [Financiera].[fct_pagos]
ADD CONSTRAINT FK_fct_pagos_fct_creditos
FOREIGN KEY (int_id_credito) REFERENCES [Financiera].[fct_creditos](int_id_credito);
GO

-- fct_cartera_diaria -> fct_creditos
ALTER TABLE [Financiera].[fct_cartera_diaria]
ADD CONSTRAINT FK_fct_cartera_diaria_fct_creditos
FOREIGN KEY (int_id_credito) REFERENCES [Financiera].[fct_creditos](int_id_credito);
GO

-- fct_cartera_diaria -> dim_clientes
ALTER TABLE [Financiera].[fct_cartera_diaria]
ADD CONSTRAINT FK_fct_cartera_diaria_dim_clientes
FOREIGN KEY (int_id_cliente) REFERENCES [Financiera].[dim_clientes](int_id_cliente);
GO

-- fct_cartera_diaria -> dim_productos
ALTER TABLE [Financiera].[fct_cartera_diaria]
ADD CONSTRAINT FK_fct_cartera_diaria_dim_productos
FOREIGN KEY (int_id_producto) REFERENCES [Financiera].[dim_productos](int_id_producto);
GO

-- =============================================
-- ÍNDICES PARA MEJORAR RENDIMIENTO DE FKs
-- =============================================

-- Índices en dim_empleados
CREATE INDEX IX_dim_empleados_sucursal 
ON [Financiera].[dim_empleados](int_id_sucursal);
GO

-- Índices en fct_creditos
CREATE INDEX IX_fct_creditos_cliente 
ON [Financiera].[fct_creditos](int_id_cliente);
GO

CREATE INDEX IX_fct_creditos_producto 
ON [Financiera].[fct_creditos](int_id_producto);
GO

CREATE INDEX IX_fct_creditos_sucursal 
ON [Financiera].[fct_creditos](int_id_sucursal);
GO

CREATE INDEX IX_fct_creditos_empleado 
ON [Financiera].[fct_creditos](int_id_empleado);
GO

-- Índices en fct_pagos
CREATE INDEX IX_fct_pagos_credito 
ON [Financiera].[fct_pagos](int_id_credito);
GO

CREATE INDEX IX_fct_pagos_fecha_pago 
ON [Financiera].[fct_pagos](dtm_fecha_pago);
GO

-- Índices en fct_cartera_diaria
CREATE INDEX IX_fct_cartera_credito 
ON [Financiera].[fct_cartera_diaria](int_id_credito);
GO

CREATE INDEX IX_fct_cartera_cliente 
ON [Financiera].[fct_cartera_diaria](int_id_cliente);
GO

CREATE INDEX IX_fct_cartera_producto 
ON [Financiera].[fct_cartera_diaria](int_id_producto);
GO

CREATE INDEX IX_fct_cartera_fecha_corte 
ON [Financiera].[fct_cartera_diaria](dtm_fecha_corte);
GO

-- =============================================
-- COMENTARIOS PARA DOCUMENTACIÓN
-- =============================================

-- Comentarios en Foreign Keys
EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Relación con sucursal donde trabaja el empleado',
    @level0type = N'SCHEMA', @level0name = N'Financiera',
    @level1type = N'TABLE', @level1name = N'dim_empleados',
    @level2type = N'CONSTRAINT', @level2name = N'FK_dim_empleados_dim_sucursales';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Relación con cliente titular del crédito',
    @level0type = N'SCHEMA', @level0name = N'Financiera',
    @level1type = N'TABLE', @level1name = N'fct_creditos',
    @level2type = N'CONSTRAINT', @level2name = N'FK_fct_creditos_dim_clientes';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Relación con producto financiero contratado',
    @level0type = N'SCHEMA', @level0name = N'Financiera',
    @level1type = N'TABLE', @level1name = N'fct_creditos',
    @level2type = N'CONSTRAINT', @level2name = N'FK_fct_creditos_dim_productos';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Relación con sucursal donde se originó el crédito',
    @level0type = N'SCHEMA', @level0name = N'Financiera',
    @level1type = N'TABLE', @level1name = N'fct_creditos',
    @level2type = N'CONSTRAINT', @level2name = N'FK_fct_creditos_dim_sucursales';
GO

EXEC sys.sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Relación con empleado asesor del crédito',
    @level0type = N'SCHEMA', @level0name = N'Financiera',
    @level1type = N'TABLE', @level1name = N'fct_creditos',
    @level2type = N'CONSTRAINT', @level2name = N'FK_fct_creditos_dim_empleados';
GO

-- =============================================
-- VERIFICACIÓN DE INTEGRIDAD REFERENCIAL
-- =============================================

-- Script para verificar que las foreign keys están correctamente creadas
SELECT 
    fk.name AS foreign_key_name,
    tp.name AS parent_table,
    cp.name AS parent_column,
    tr.name AS referenced_table,
    cr.name AS referenced_column
FROM sys.foreign_keys fk
INNER JOIN sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
WHERE tp.schema_id = SCHEMA_ID('Financiera')
ORDER BY tp.name, fk.name;
GO

PRINT 'Foreign Keys creadas exitosamente para el esquema Financiera';
GO