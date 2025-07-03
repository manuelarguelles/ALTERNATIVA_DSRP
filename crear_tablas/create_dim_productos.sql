
CREATE TABLE [Financiera].[dim_productos] (
    int_id_producto INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_producto VARCHAR(20) NOT NULL UNIQUE,
    vch_nombre_producto VARCHAR(100) NOT NULL,
    vch_tipo_producto VARCHAR(50) NOT NULL,
    dbl_tasa_interes_min FLOAT,
    dbl_tasa_interes_max FLOAT,
    mny_monto_minimo MONEY,
    mny_monto_maximo MONEY,
    int_plazo_minimo_meses INT,
    int_plazo_maximo_meses INT,
    int_flag_activo INT DEFAULT 1
);
