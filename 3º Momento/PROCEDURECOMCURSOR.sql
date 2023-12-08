CREATE PROCEDURE GerarRelatorioMaquinas
AS
BEGIN
    DECLARE @IDMaquina INT,
            @NumeroSerie CHAR(7),
            @Estado VARCHAR(30),
            @Tipo VARCHAR(30),
            @HorarioReserva DATETIME2,
            @TempoDeReserva TIME,
            @DataHoraInicioUso DATETIME2,
            @DataHoraFimUso DATETIME2,
            @ValorCobradoUso DECIMAL(10, 2),
            @UltimaManutencao DATE,
            @DescricaoManutencao VARCHAR(100),
            @EstadoManutencao BIT;

    DECLARE relatorioCursor CURSOR FOR
    SELECT
        M.IDMaquina,
        M.NumeroSerie,
        M.Estado,
        M.Tipo,
        R.Horario,
        R.TempoDeReserva,
        RU.DataHoraInicio,
        RU.DataHoraFim,
        RU.ValorCobrado,
        MAX(Ma.DataManutencao) AS UltimaManutencao,
        Ma.Descricao,
        Ma.Estado AS EstadoManutencao
    FROM
        Maquina M
    LEFT JOIN Reserva R ON M.IDMaquina = R.IDMaquina
    LEFT JOIN RegistroDeUso RU ON M.IDMaquina = RU.IDMaquina
    LEFT JOIN Manutencao Ma ON M.IDMaquina = Ma.IDMaquina
    GROUP BY
        M.IDMaquina,
        M.NumeroSerie,
        M.Estado,
        M.Tipo,
        R.Horario,
        R.TempoDeReserva,
        RU.DataHoraInicio,
        RU.DataHoraFim,
        RU.ValorCobrado,
        Ma.Descricao,
        Ma.Estado;

    OPEN relatorioCursor;

    FETCH NEXT FROM relatorioCursor INTO
        @IDMaquina,
        @NumeroSerie,
        @Estado,
        @Tipo,
        @HorarioReserva,
        @TempoDeReserva,
        @DataHoraInicioUso,
        @DataHoraFimUso,
        @ValorCobradoUso,
        @UltimaManutencao,
        @DescricaoManutencao,
        @EstadoManutencao;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO RelatorioMaquinas (
            IDMaquina,
            NumeroSerie,
            Estado,
            Tipo,
            HorarioReserva,
            TempoDeReserva,
            DataHoraInicioUso,
            DataHoraFimUso,
            ValorCobradoUso,
            UltimaManutencao,
            DescricaoManutencao,
            EstadoManutencao
        )
        VALUES (
            @IDMaquina,
            @NumeroSerie,
            @Estado,
            @Tipo,
            @HorarioReserva,
            @TempoDeReserva,
            @DataHoraInicioUso,
            @DataHoraFimUso,
            @ValorCobradoUso,
            @UltimaManutencao,
            @DescricaoManutencao,
            @EstadoManutencao
        );

        FETCH NEXT FROM relatorioCursor INTO
            @IDMaquina,
            @NumeroSerie,
            @Estado,
            @Tipo,
            @HorarioReserva,
            @TempoDeReserva,
            @DataHoraInicioUso,
            @DataHoraFimUso,
            @ValorCobradoUso,
            @UltimaManutencao,
            @DescricaoManutencao,
            @EstadoManutencao;
    END

    CLOSE relatorioCursor;
    DEALLOCATE relatorioCursor;
END;

EXEC GerarRelatorioMaquinas;
SELECT * FROM RelatorioMaquinas