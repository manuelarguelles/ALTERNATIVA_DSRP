CREATE TABLE [Financiera].[dim_clientes] (
    int_id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_cliente VARCHAR(20) NOT NULL UNIQUE,
    vch_nombres_cliente VARCHAR(100) NOT NULL,
    vch_apellidos_cliente VARCHAR(100) NOT NULL,
    vch_documento_identidad VARCHAR(20) NOT NULL UNIQUE,
    vch_tipo_documento VARCHAR(10) NOT NULL,
    dtm_fecha_nacimiento DATETIME NOT NULL,
    vch_estado_civil VARCHAR(20),
    vch_ocupacion VARCHAR(50),
    mny_ingresos_declarados MONEY,
    int_score_crediticio INT,
    dtm_fecha_registro DATETIME DEFAULT GETDATE(),
    int_flag_activo INT DEFAULT 1
);