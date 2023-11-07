--Inserção na Tabela Comanda
INSERT INTO Comanda (IDCliente, IDItemLanchonete, Quantidade)
VALUES (1, 1, 2),
	   (3, 3, 3),
	   (5, 5, 5);

--Inserção Tabela NotaFiscal
INSERT INTO NotaFiscal (DataVenda, IDCliente, ValorTotal, FormaPagamento, IDFuncionario)
VALUES ('2023-09-13', 1, 100.00, 'Cartão de Crédito', 1),
	   ('2023-09-14', 2, 75.50, 'Dinheiro', 1),
	   ('2023-09-15', 3, 120.25, 'Cartão de Débito', 3),
	   ('2023-09-16', 4, 50.00, 'Dinheiro', 5),
	   ('2023-09-17', 5, 80.75, 'Cartão de Crédito',3);

--Inserção na Tabela RegistroDeUso
INSERT INTO RegistroDeUso (IDCliente, IDMaquina, DataHoraInicio, DataHoraFim, ValorCobrado)
VALUES (1, 1, '2023-09-13 08:00:00', '2023-09-13 10:00:00', 50.00),
	   (2, 2, '2023-09-14 09:30:00', '2023-09-14 11:30:00', 65.75),
	   (3, 3, '2023-09-15 14:00:00', '2023-09-15 15:30:00', 30.50),
	   (4, 4, '2023-09-16 10:45:00', '2023-09-16 12:45:00', 40.25),
	   (5, 5, '2023-09-17 13:15:00', '2023-09-17 14:45:00', 55.00);

--Inserção de dados na Tabela Reserva
INSERT INTO Reserva (IDCliente, IDMaquina, Horario)
VALUES (1, 1, '2023-09-20 10:00:00'),
	   (3, 3, '2023-09-22 11:15:00'),
	   (5, 5, '2023-09-24 16:00:00');

--Inserção na Tabela Comanda para o uso na função
INSERT INTO Comanda VALUES (1,5,5);

--Inserção na Tabela RegistrodeUso para uso na procedure
INSERT INTO RegistroDeUso VALUES (4,1,'2023-11-07 00:30', '2023-11-07 02:30', 50)

