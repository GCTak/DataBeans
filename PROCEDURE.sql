--Criação Procedure para atualizar o ValorTotal da tabela Comanda
CREATE PROCEDURE AtualizarValorTotalComanda
AS
BEGIN
    UPDATE c
    SET ValorTotal = (SELECT SUM(ValorTotalItem) FROM ItemComanda WHERE IDCliente = c.IDCliente)
    FROM Comanda c
    WHERE c.IDCliente IN (SELECT IDCliente FROM ItemComanda) AND c.IDFuncionario IN (SELECT IDFuncionario From ItemComanda);
END;
--Trigger para chamar a procedure automaticamente
CREATE TRIGGER AtualizarComandaValorTotal
ON ItemComanda
AFTER INSERT
AS
BEGIN
    DECLARE @IDCliente INT, @DataVenda DATE;
    SELECT @IDCliente = IDCliente, @DataVenda = DataVenda
    FROM inserted;
    EXEC AtualizarValorTotalComanda;
END;
--Teste
SELECT * FROM Comanda
INSERT INTO ItemComanda VALUES(1,1,1,7,'2023-11-07',2.5)
SELECT * FROM Comanda
