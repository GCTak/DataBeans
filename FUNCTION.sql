-- Função para calcular o tempo de uso da máquina em uma data específica
CREATE FUNCTION CalcularTempoUso(@IDCliente INT, @DataReferencia DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TempoUso INT;
    SELECT @TempoUso = CONVERT(INT,DATEDIFF(MINUTE, DataHoraInicio, DataHoraFim))
    FROM RegistroDeUso
    WHERE IDCliente = @IDCliente AND CAST(DataHoraInicio AS DATE) = @DataReferencia;
    RETURN @TempoUso;
END;
-- Função para calcular o valor total do cliente em uma data específica
CREATE FUNCTION CalcularValorTotalCliente(@IDCliente INT, @DataReferencia DATE)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @ValorTotal DECIMAL(10, 2);
    SELECT @ValorTotal = ISNULL(SUM(ru.ValorCobrado), 0) + ISNULL(SUM(dsa.ValorTotal), 0) + ISNULL(SUM(c.ValorTotal), 0)
    FROM RegistroDeUso ru
    LEFT JOIN Comanda c ON ru.IDCliente = c.IDCliente AND CAST(ru.DataHoraInicio AS DATE) = @DataReferencia
    LEFT JOIN DetalheServicoAdicional dsa ON ru.IDCliente = dsa.IDCliente AND CAST(ru.DataHoraInicio AS DATE) = @DataReferencia
    WHERE ru.IDCliente = @IDCliente AND CAST(ru.DataHoraInicio AS DATE) = @DataReferencia;
    RETURN @ValorTotal;
END;
