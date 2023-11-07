CREATE TRIGGER Atualizar_Estoque
ON Comanda
AFTER INSERT
AS
BEGIN
    UPDATE Lanchonete
    SET Quantidade = Quantidade - (SELECT Quantidade FROM inserted)
    WHERE Lanchonete.IDItemLanchonete = (SELECT IDItemLanchonete FROM inserted);
END;

--DEMONSTRAÇÃO:
SELECT * FROM Lanchonete;

INSERT INTO Comanda (IDCliente, IDItemLanchonete, Quantidade)
VALUES (2, 2, 2);

SELECT * FROM Lanchonete;
