
CREATE TABLE [Financiera].[lkp_clasificacion_riesgo] (
    int_id_clasificacion INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_clasificacion VARCHAR(20) NOT NULL UNIQUE,
    vch_descripcion VARCHAR(100) NOT NULL,
    dbl_provision_minima FLOAT,
    int_dias_atraso_min INT,
    int_dias_atraso_max INT
);
