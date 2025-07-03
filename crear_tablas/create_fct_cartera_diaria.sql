
CREATE TABLE [Financiera].[fct_cartera_diaria] (
    int_id_cartera INT IDENTITY(1,1) PRIMARY KEY,
    dtm_fecha_corte DATETIME NOT NULL,
    int_id_credito INT NOT NULL,
    int_id_cliente INT NOT NULL,
    int_id_producto INT NOT NULL,
    mny_saldo_capital MONEY,
    mny_interes_devengado MONEY,
    mny_mora_acumulada MONEY DEFAULT 0,
    int_dias_atraso INT DEFAULT 0,
    vch_clasificacion_riesgo VARCHAR(20),
    dbl_provision_requerida FLOAT,
    mny_provision_constituida MONEY,
    int_flag_castigado INT DEFAULT 0
);
