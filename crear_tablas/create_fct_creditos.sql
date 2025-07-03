
CREATE TABLE [Financiera].[fct_creditos] (
    int_id_credito INT IDENTITY(1,1) PRIMARY KEY,
    int_id_cliente INT NOT NULL,
    int_id_producto INT NOT NULL,
    int_id_sucursal INT NOT NULL,
    int_id_empleado INT NOT NULL,
    dtm_fecha_solicitud DATETIME NOT NULL,
    dtm_fecha_aprobacion DATETIME,
    dtm_fecha_desembolso DATETIME,
    mny_monto_solicitado MONEY,
    mny_monto_aprobado MONEY,
    mny_monto_desembolsado MONEY,
    dbl_tasa_interes FLOAT,
    int_plazo_meses INT,
    mny_cuota_mensual MONEY,
    vch_estado_credito VARCHAR(20),
    int_flag_refinanciado INT DEFAULT 0
);
