-- Stored procedure para listar registros de uso de uma máquina
CREATE PROCEDURE ListarRegistrosDeUsoDaMaquina
    @IDMaquina INT
AS
BEGIN
    SELECT
        R.IDRegistroUso,
        R.IDCliente,
        C.Nome AS NomeCliente,
        R.DataHoraInicio,
        R.DataHoraFim,
        R.ValorCobrado
    FROM RegistroDeUso R
    INNER JOIN Cliente C ON R.IDCliente = C.IDCliente
    WHERE R.IDMaquina = @IDMaquina
    ORDER BY R.DataHoraInicio;
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Nenhum registro de uso encontrado para a máquina com ID ' + CAST(@IDMaquina AS VARCHAR);
    END
END;

-- Sintaxe para executar a stored procedure
EXECUTE ListarRegistrosDeUsoDaMaquina 1; 

SELECT * FROM RegistroDeUso