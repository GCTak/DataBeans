--Transa��o  - Commit
BEGIN TRANSACTION;

	INSERT INTO Cliente VALUES('Lucas Eduardo', '2002-11-15', 'Rua Cleantro Vieira, 466', '34999999999', 'luquinhas420@hotmail.com');

COMMIT;

--Transa��o - Rollback

BEGIN TRANSACTION;

	INSERT INTO Reserva VALUES (6, 1, '18:00');

ROLLBACK