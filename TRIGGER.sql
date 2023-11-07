CREATE TRIGGER Atualizar_Estoque
ON Comanda
AFTER INSERT
AS
BEGIN
    UPDATE Lanchonete
    SET Lanchonete.Quantidade = Lanchonete.Quantidade - i.Quantidade
    FROM Lanchonete
    INNER JOIN inserted AS i ON Lanchonete.IDItemLanchonete = i.IDItemLanchonete;
END;

--DEMONSTRAÇÃO:
SELECT * FROM Lanchonete;

INSERT INTO Comanda (IDCliente, IDItemLanchonete, Quantidade)
VALUES (2, 2, 2);

SELECT * FROM Lanchonete;
