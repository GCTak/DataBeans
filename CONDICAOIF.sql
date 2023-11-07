--Determinar se um cliente tem comandas com base no seu ID.
CREATE FUNCTION ClienteTemComandas (@IDCliente INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @TemComandas VARCHAR(3)
    
    IF EXISTS (SELECT 1 FROM Comanda WHERE IDCliente = @IDCliente)
        SET @TemComandas = 'Sim'
    ELSE
        SET @TemComandas = 'Não'

    RETURN @TemComandas
END;

ALTER TABLE NotaFiscal
ADD ClienteTemComandas AS dbo.ClienteTemComandas(IDCliente);

SELECT * FROM NotaFiscal;

