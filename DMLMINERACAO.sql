INSERT INTO RegistroDeUso VALUES
(11,1,'2023-11-09 22:00', '2023-11-10 05:00',35),
(12,4,'2023-11-09 22:00','2023-11-10 05:00',35),
(14,13,'2023-11-09 22:00','2023-11-10 05:00',35),
(15,15,'2023-11-09 22:00','2023-11-10 05:00',35),
(16,19, '2023-11-09 22:00','2023-11-10 05:00',35);

UPDATE Manutencao 
SET Estado = 1;

UPDATE Maquina
SET Estado = 'Dispon�vel'
WHERE Estado = 'Reservado';

INSERT INTO Comanda VALUES 
	(11,25, '2023-11-09',0),
	(12,26, '2023-11-09',0),
	(14,44, '2023-11-09',0),
	(15,45, '2023-11-09',0),
	(16,47, '2023-11-09',0);

INSERT INTO ItemComanda VALUES(11, 22, 25, 1,'2023-11-09', 1.50)
INSERT INTO ItemComanda VALUES(11, 29, 25, 1,'2023-11-09', 1.20)
INSERT INTO ItemComanda VALUES(12, 23, 26, 1,'2023-11-09', 1.50)
INSERT INTO ItemComanda VALUES(12, 29, 26, 1,'2023-11-09', 1.20)
INSERT INTO ItemComanda VALUES(14, 24, 44, 1,'2023-11-09', 2)
INSERT INTO ItemComanda VALUES(14, 29, 44, 1,'2023-11-09', 1.20)
INSERT INTO ItemComanda VALUES(15, 25, 45, 1, '2023-11-09', 6.80)
INSERT INTO ItemComanda VALUES(15, 28, 45, 1, '2023-11-09', 2)
INSERT INTO ItemComanda VALUES(16, 27, 47, 1, '2023-11-09', 6.75)
INSERT INTO ItemComanda VALUES(16, 28, 47, 1, '2023-11-09', 2)
INSERT INTO ItemComanda VALUES(11, 35, 25, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(11, 39, 25, 1,'2023-11-09', 5)
INSERT INTO ItemComanda VALUES(12, 35, 26, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(12, 39, 26, 1,'2023-11-09', 5)
INSERT INTO ItemComanda VALUES(14, 35, 44, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(14, 39, 44, 1,'2023-11-09', 5)
INSERT INTO ItemComanda VALUES(15, 35, 45, 1, '2023-11-09', 8)
INSERT INTO ItemComanda VALUES(15, 39, 45, 1, '2023-11-09', 5)
INSERT INTO ItemComanda VALUES(16, 35, 47, 1, '2023-11-09', 8)
INSERT INTO ItemComanda VALUES(16, 39, 47, 1, '2023-11-09', 5)
INSERT INTO ItemComanda VALUES(11, 35, 25, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(11, 13, 25, 1,'2023-11-09', 2.70)
INSERT INTO ItemComanda VALUES(12, 35, 26, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(12, 15, 26, 1,'2023-11-09', 2.70)
INSERT INTO ItemComanda VALUES(14, 35, 44, 1,'2023-11-09', 8)
INSERT INTO ItemComanda VALUES(14, 14, 44, 1,'2023-11-09', 2.70)
INSERT INTO ItemComanda VALUES(15, 35, 45, 1, '2023-11-09', 8)
INSERT INTO ItemComanda VALUES(15, 13, 45, 1, '2023-11-09', 2.70)
INSERT INTO ItemComanda VALUES(16, 35, 47, 1, '2023-11-09', 8)
INSERT INTO ItemComanda VALUES(16, 13, 47, 1, '2023-11-09', 2.70)

INSERT INTO ServicoAdicional VALUES ('Coruj�o', 5,1)
INSERT INTO ServicoAdicional VALUES ('Coruj�o', 5,4)
INSERT INTO ServicoAdicional VALUES ('Coruj�o', 5,13)
INSERT INTO ServicoAdicional VALUES ('Coruj�o', 5,15)
INSERT INTO ServicoAdicional VALUES ('Coruj�o', 5,19)

INSERT INTO DetalheServicoAdicional VALUES (11,14,1,5,'2023-11-09')
INSERT INTO DetalheServicoAdicional VALUES (12,15,1,5,'2023-11-09')
INSERT INTO DetalheServicoAdicional VALUES (14,16,1,5,'2023-11-09')
INSERT INTO DetalheServicoAdicional VALUES (15,17,1,5,'2023-11-09')
INSERT INTO DetalheServicoAdicional VALUES (16,18,1,5,'2023-11-09')