BEGIN TRANSACTION;
	IF EXISTS(SELECT * FROM Maquina WHERE Estado = 'Disponível')
	BEGIN
		INSERT INTO Reserva VALUES(10,9,'2023-11-15 16:00','05:00')
	COMMIT
	PRINT 'Reserva efetuada com sucesso!';
   END
   ELSE 
	BEGIN
		ROLLBACK
		PRINT 'Máquina não está disponível para reserva';
END;
