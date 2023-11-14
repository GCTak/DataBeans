CREATE TABLE Pessoa (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(300),
    Telefone CHAR(11) NOT NULL,
    Email VARCHAR(100),
    TipoEntidade VARCHAR(50) 
);

CREATE TABLE Cliente (
    IDCliente INT NOT NULL PRIMARY KEY,
	DataCadastro DATE NOT NULL, 
	StatusConta VARCHAR(15) NOT NULL,
	HorasUso TIME,
    FOREIGN KEY (IDCliente) REFERENCES Pessoa (ID),
    TipoEntidade AS 'Cliente' PERSISTED 
);

CREATE TABLE Funcionario (
    IDFuncionario INT NOT NULL PRIMARY KEY ,
    Cargo VARCHAR(50) NOT NULL,
    DataContratacao DATE NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IDFuncionario) REFERENCES Pessoa (ID),
    TipoEntidade AS 'Funcionario' PERSISTED 
);
