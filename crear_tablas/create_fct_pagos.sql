
CREATE TABLE [Financiera].[fct_pagos] (
    int_id_pago INT IDENTITY(1,1) PRIMARY KEY,
    int_id_credito INT NOT NULL,
    dtm_fecha_pago DATETIME NOT NULL,
    dtm_fecha_vencimiento DATETIME NOT NULL,
    mny_cuota_programada MONEY,
    mny_capital_programado MONEY,
    mny_interes_programado MONEY,
    mny_monto_pagado MONEY,
    mny_capital_pagado MONEY,
    mny_interes_pagado MONEY,
    mny_mora_pagada MONEY DEFAULT 0,
    int_dias_atraso INT DEFAULT 0,
    vch_canal_pago VARCHAR(20),
    int_numero_cuota INT
);
