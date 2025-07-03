
CREATE TABLE [Financiera].[lkp_canales_pago] (
    int_id_canal INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_canal VARCHAR(20) NOT NULL UNIQUE,
    vch_descripcion_canal VARCHAR(100) NOT NULL,
    int_flag_activo INT DEFAULT 1
);
