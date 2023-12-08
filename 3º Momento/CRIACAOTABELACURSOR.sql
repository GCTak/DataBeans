CREATE TABLE RelatorioMaquinas (
    IDMaquina INT,
    NumeroSerie CHAR(7),
    Estado VARCHAR(30),
    Tipo VARCHAR(30),
    HorarioReserva DATETIME2,
    TempoDeReserva TIME,
    DataHoraInicioUso DATETIME2,
    DataHoraFimUso DATETIME2,
    ValorCobradoUso DECIMAL(10, 2),
    UltimaManutencao DATE,
    DescricaoManutencao VARCHAR(100),
    EstadoManutencao BIT
);
