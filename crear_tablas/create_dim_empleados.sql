
CREATE TABLE [Financiera].[dim_empleados] (
    int_id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_empleado VARCHAR(20) NOT NULL UNIQUE,
    vch_nombres_empleado VARCHAR(100) NOT NULL,
    vch_apellidos_empleado VARCHAR(100) NOT NULL,
    vch_cargo VARCHAR(50),
    vch_area VARCHAR(50),
    int_id_sucursal INT,
    dtm_fecha_ingreso DATETIME,
    mny_salario_base MONEY,
    int_flag_activo INT DEFAULT 1
);
