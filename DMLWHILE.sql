--WHILE e BREAK
----Inserção de dados na Tabela Cliente
		DECLARE @Contador INT = 1;

		WHILE @Contador <= 5
		BEGIN
			INSERT INTO Cliente (Nome, DataNascimento, Endereco, Telefone, Email)
			VALUES ('Cliente ' + CAST(@Contador AS VARCHAR(5)),
					DATEADD(YEAR, -@Contador, GETDATE()), 
					'Endereço ' + CAST(@Contador AS VARCHAR(5)),
					'Telefone ' + CAST(@Contador AS VARCHAR(5)),
					'cliente' + CAST(@Contador AS VARCHAR(5)) + '@example.com');

			SET @Contador = @Contador + 1;

			 IF @Contador > 5
				BREAK;
		END;

----Inserção de dados na Tabela Maquina
		DECLARE @Contador1 INT = 1;

		WHILE @Contador1 <= 5
		BEGIN
			INSERT INTO Maquina (NumeroSerie, Estado, Tipo, Especificacoes)
			VALUES ('Serie' + CAST(@Contador1 AS VARCHAR(5)),
					'Disponível',
					'Tipo' + CAST(@Contador1 AS VARCHAR(5)),
					'Especificacoes da Máquina ' + CAST(@Contador1 AS VARCHAR(5)));

			SET @Contador1 = @Contador1 + 1;


			IF @Contador1 > 5
				BREAK; 
		END;

----Inserção de dados na Tabela Funcionario
		DECLARE @Contador2 INT = 1;

		WHILE @Contador2 <= 5
		BEGIN
			INSERT INTO Funcionario (Nome, Cargo, DataContratacao, Salario, Endereco, Telefone, Email)
			VALUES ('Funcionario ' + CAST(@Contador2 AS VARCHAR(5)),
					'Cargo ' + CAST(@Contador2 AS VARCHAR(5)),
					GETDATE(),
					50000.00,
					'Endereço ' + CAST(@Contador2 AS VARCHAR(5)),
					'Telefone ' + CAST(@Contador2 AS VARCHAR(5)),
					'funcionario' + CAST(@Contador2 AS VARCHAR(5)) + '@example.com');

			SET @Contador2 = @Contador2 + 1;

			IF @Contador2 > 5
				BREAK; 
		END;

----Inserção de dados na Tabela Lanchonete
		DECLARE @Contador3 INT = 1;

		WHILE @Contador3 <= 5
		BEGIN
			INSERT INTO Lanchonete (Nome, Preco, Quantidade)
			VALUES ('Item ' + CAST(@Contador3 AS VARCHAR(5)),
					10.00 + (@Contador3 * 2), 
					@Contador3 * 3); 

			SET @Contador3 = @Contador3 + 1;

			IF @Contador3 > 5
				BREAK; 
		END;

--WHILE e CONTINUE
----Inserção se o contador for par
		DECLARE @Contador4 INT = 1;

		WHILE @Contador4 <= 5
		BEGIN
			IF @Contador4 % 2 <> 0
			BEGIN
				SET @Contador4 = @Contador4 + 1;
				CONTINUE; 
			END

			INSERT INTO Manutencao (IDMaquina, DataManutencao, Descricao, Estado)
			VALUES (@Contador4, 
					GETDATE(), 
					'Manutenção da Máquina ' + CAST(@Contador4 AS VARCHAR(5)),
					1); 

			SET @Contador4 = @Contador4 + 1;

			IF @Contador4 > 5
				BREAK;
		END;
----Se o IDMaquina for par
		DECLARE @Contador5 INT = 1;

		WHILE @Contador5 <= 5
		BEGIN
			IF @Contador5 % 2 <> 0
			BEGIN
				SET @Contador5 = @Contador5 + 1;
				CONTINUE;
			END

			INSERT INTO ServicoAdicional (Nome, Preco, IDMaquina)
			VALUES ('Serviço ' + CAST(@Contador5 AS VARCHAR(5)),
					20.00 + (@Contador5 * 5), 
					@Contador5); 

			SET @Contador5 = @Contador5 + 1;

			IF @Contador5 > 5
				BREAK;
		END;