-- Criação Procedure para atualizar o ValorTotal da tabela Comanda
CREATE PROCEDURE AtualizarValorTotalComanda
    @IDCliente INT,
    @DataVenda DATE
AS
BEGIN
    UPDATE c
    SET ValorTotal = (
            SELECT SUM(ic.ValorTotalItem)
            FROM ItemComanda ic
            WHERE ic.IDCliente = @IDCliente AND ic.DataVenda = @DataVenda
        )
    FROM Comanda c
    WHERE c.IDCliente = @IDCliente AND c.IDFuncionario IN (SELECT IDFuncionario FROM ItemComanda WHERE IDCliente = @IDCliente AND DataVenda = @DataVenda);
END;

-- Trigger para chamar a procedure automaticamente
CREATE TRIGGER AtualizarComandaValorTotal
ON ItemComanda
AFTER INSERT
AS
BEGIN
    DECLARE @IDCliente INT, @DataVenda DATE;
    SELECT @IDCliente = IDCliente, @DataVenda = DataVenda
    FROM inserted;
    EXEC AtualizarValorTotalComanda @IDCliente, @DataVenda;
END;
