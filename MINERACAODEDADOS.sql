WITH CTE_Counts AS (
    SELECT
        sa.Nome AS ServicoAdicional,
        CONCAT('Energético: ', l.Nome) AS ItemLanchonete,
        COUNT(*) AS Occurrences
    FROM
        DetalheServicoAdicional dsa
    JOIN
        ServicoAdicional sa ON dsa.IDServicoAdicional = sa.IDServicoAdicional
    JOIN
        Pessoa p ON dsa.IDCliente = p.ID
    JOIN
        ItemComanda ic ON ic.IDCliente = p.ID
    JOIN
        Lanchonete l ON ic.IDItemLanchonete = l.IDItemLanchonete
    WHERE
        sa.Nome = 'Corujão' AND l.Nome LIKE 'Energético%'
        AND p.TipoEntidade = 'Cliente'
    GROUP BY
        sa.Nome, l.Nome
)
SELECT
    ServicoAdicional,
    ItemLanchonete,
    Occurrences,
    Occurrences * 1.0 / (SELECT COUNT(*) FROM CTE_Counts) AS Suporte
FROM
    CTE_Counts;
