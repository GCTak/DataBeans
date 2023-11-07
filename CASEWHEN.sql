--Lista os funcionários e os seus respectivos status de vendas
SELECT
    F.Nome AS NomeFuncionario,
    CASE
        WHEN EXISTS (SELECT 1 FROM NotaFiscal NF WHERE NF.IDFuncionario = F.IDFuncionario) THEN 'Efetuou Vendas'
        ELSE 'Não Efetuou Vendas'
    END AS StatusVendas
FROM
    Funcionario F;
