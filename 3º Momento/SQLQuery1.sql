CREATE TRIGGER AtualizarValorTotalNotaFiscal
ON RegistroDeUso
AFTER INSERT
AS
BEGIN
    -- Atualize a tabela NotaFiscal para incluir os valores do RegistroDeUso
    UPDATE nf
    SET nf.ValorTotal = COALESCE(subquery.ValorTotalComandas, 0) + COALESCE(ru.ValorTotalRegistroUso, 0)
    FROM NotaFiscal nf
    LEFT JOIN (
        SELECT c.IDCliente, SUM((l.Preco * c.Quantidade)) AS ValorTotalComandas
        FROM Comanda c
        JOIN Lanchonete l ON c.IDItemLanchonete = l.IDItemLanchonete
        GROUP BY c.IDCliente
    ) subquery ON nf.IDCliente = subquery.IDCliente
    LEFT JOIN (
        SELECT ru.IDCliente, SUM(ru.ValorCobrado) AS ValorTotalRegistroUso
        FROM RegistroDeUso ru
        WHERE CAST(ru.DataHoraInicio AS DATE) = CAST(GETDATE() AS DATE) 
        GROUP BY ru.IDCliente
    ) ru ON nf.IDCliente = ru.IDCliente;
END;

