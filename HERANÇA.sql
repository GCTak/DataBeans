--Herança no banco de dados

CREATE TABLE ClienteRegular (
    IDCliente INT PRIMARY KEY,
    DataCadastro DATE,
	FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);
CREATE TABLE ClienteVIP (
    IDCliente INT PRIMARY KEY,
    NivelVIP INT,
	Beneficios VARCHAR(255),
	FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);