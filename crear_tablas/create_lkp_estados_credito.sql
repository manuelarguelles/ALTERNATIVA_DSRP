
CREATE TABLE [Financiera].[lkp_estados_credito] (
    int_id_estado INT IDENTITY(1,1) PRIMARY KEY,
    vch_codigo_estado VARCHAR(20) NOT NULL UNIQUE,
    vch_descripcion_estado VARCHAR(100) NOT NULL,
    int_orden_proceso INT
);
