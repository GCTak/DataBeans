--Criação da função para calcular o valor total gasto pelo cliente em uma data específica
CREATE FUNCTION CalcularValorTotalCliente(@IDCliente INT, @DataReferencia DATE)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @ValorGasto DECIMAL(10, 2);
    SET @ValorGasto = 0;
    SELECT @ValorGasto = @ValorGasto + ISNULL(ValorTotal, 0)
    FROM Comanda
    WHERE IDCliente = @IDCliente AND DataVenda = @DataReferencia;
    SELECT @ValorGasto = @ValorGasto + ISNULL(ValorCobrado, 0)
    FROM RegistroDeUso
    WHERE IDCliente = @IDCliente AND DataHoraInicio = @DataReferencia;
    SELECT @ValorGasto = @ValorGasto + ISNULL(ValorTotal, 0)
    FROM DetalheServicoAdicional
    WHERE IDCliente = @IDCliente AND DataPrestacao = @DataReferencia;
    RETURN @ValorGasto;
END;
--Uso da Função
DECLARE @IDCliente INT = 1;
DECLARE @DataReferencia DATE = '2023-11-10';
DECLARE @ValorTotalGasto DECIMAL(10, 2);
SET @ValorTotalGasto = dbo.CalcularValorTotalCliente(@IDCliente, @DataReferencia);
PRINT 'O valor total gasto pelo cliente é: ' + CAST(@ValorTotalGasto AS VARCHAR(20));
