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
			FROM Comanda  c
			INNER JOIN Pessoa p ON c.IDFuncionario = p.ID
            WHERE c.IDCliente = @IDCliente AND CONVERT(DATE, c.DataVenda) = @DataVenda
        )
        BEGIN
            EXEC AtualizarValorTotalComanda @IDCliente, @DataVenda;
        END;
    END;
END;

--Necessário executar esse script antes para contar com os que já foram inseridos, depois daqui executa como esperado
INSERT INTO ItemComanda VALUES (1,37,27,1,'2023-11-07',0.35);
INSERT INTO ItemComanda VALUES (1,37,27,1,'2023-11-10',0.35); 
INSERT INTO ItemComanda VALUES (4,37,26,1,'2023-11-06',0.35);
INSERT INTO ItemComanda VALUES(5,37,25,1,'2023-11-08',0.35);
INSERT INTO ItemComanda VALUES (9,37,26,1,'2023-11-06',0.35);
INSERT INTO ItemComanda VALUES(13,37,31,1,'2023-11-03',0.35); 
INSERT INTO ItemComanda VALUES(17,37,31,1,'2023-10-30',0.35);
INSERT INTO ItemComanda VALUES(20,37,31,1,'2023-10-20',0.35); 
INSERT INTO ItemComanda VALUES(8,37,21,1,'2023-11-15',0.35);
INSERT INTO ItemComanda VALUES(3,37,22,1,'2023-11-20',0.35);

