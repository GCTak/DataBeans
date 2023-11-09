-- Criação Procedure para atualizar o ValorTotal da tabela Comanda
CREATE PROCEDURE AtualizarValorTotalComanda
    @IDCliente INT,
    @DataVenda DATE
AS
BEGIN
    UPDATE c
    SET ValorTotal = (
        SELECT ISNULL(SUM(ic.ValorTotalItem), 0)
        FROM ItemComanda ic
        WHERE ic.IDCliente = @IDCliente AND CONVERT(DATE, ic.DataVenda) = @DataVenda
    )
    FROM Comanda c
    WHERE c.IDCliente = @IDCliente AND CONVERT(DATE, c.DataVenda) = @DataVenda;
END;

-- Trigger para chamar a procedure automaticamente
CREATE TRIGGER AtualizarComandaValorTotal
ON ItemComanda
AFTER INSERT
AS
BEGIN
    DECLARE @IDCliente INT, @DataVenda DATE;
    SELECT TOP 1 @IDCliente = IDCliente, @DataVenda = CONVERT(DATE, DataVenda)
    FROM inserted
    ORDER BY DataVenda DESC;
    IF @IDCliente IS NOT NULL AND @DataVenda IS NOT NULL
    BEGIN
        IF EXISTS (
            SELECT 1
            FROM Comanda c
            WHERE c.IDCliente = @IDCliente AND CONVERT(DATE, c.DataVenda) = @DataVenda
        )
        BEGIN
            EXEC AtualizarValorTotalComanda @IDCliente, @DataVenda;
        END;
    END;
END;
