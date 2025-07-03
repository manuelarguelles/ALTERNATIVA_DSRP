
CREATE TABLE [Financiera].[dim_sucursales] (
    int_id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_sucursal VARCHAR(10) NOT NULL UNIQUE,
    vch_nombre_sucursal VARCHAR(100) NOT NULL,
    vch_direccion VARCHAR(200),
    vch_distrito VARCHAR(50),
    vch_provincia VARCHAR(50),
    vch_departamento VARCHAR(50),
    vch_gerente_sucursal VARCHAR(100),
    dtm_fecha_apertura DATETIME,
    int_flag_activo INT DEFAULT 1
);
