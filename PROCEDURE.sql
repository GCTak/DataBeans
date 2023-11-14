CREATE PROCEDURE DeletarCliente
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        IF EXISTS (SELECT 1 FROM Cliente WHERE StatusConta = 'Inativa')
        BEGIN
            DELETE FROM Cliente 
            WHERE StatusConta = 'Inativa';
            PRINT 'Clientes inativos excluídos com sucesso.';
        END
        ELSE
        BEGIN
            PRINT 'Não há clientes inativos para excluir.';
        END
        COMMIT; 
    END TRY
    BEGIN CATCH
        ROLLBACK; 
        PRINT 'Erro ao excluir clientes inativos. Transação desfeita.';
    END CATCH
END;
