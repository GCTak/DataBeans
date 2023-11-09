--Criação de Herança no banco de dados
CREATE TABLE Pessoa (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(300),
    Telefone CHAR(11) NOT NULL,
    Email VARCHAR(100),
    TipoEntidade VARCHAR(50) 
);
CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY,
    -- Colunas específicas de Cliente
    FOREIGN KEY (IDCliente) REFERENCES Pessoa (ID),
    TipoEntidade AS 'Cliente' PERSISTED 
);
CREATE TABLE Funcionario (
    IDFuncionario INT PRIMARY KEY,
    Cargo VARCHAR(50),
    DataContratacao DATE,
    Salario MONEY,
    FOREIGN KEY (IDFuncionario) REFERENCES Pessoa (ID),
    TipoEntidade AS 'Funcionario' PERSISTED 
);
