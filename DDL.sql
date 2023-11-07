
--CREATE DATABASE DataBeans;

CREATE TABLE Cliente (
    IDCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(300),
    Telefone CHAR(11) NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE Maquina (
    IDMaquina INT IDENTITY(1,1) PRIMARY KEY,
    NumeroSerie CHAR(7),
    Estado VARCHAR(30),
    Tipo VARCHAR(30),
    Especificacoes VARCHAR(1000)
);

CREATE TABLE Funcionario (
    IDFuncionario INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(150),
    Cargo VARCHAR(50),
    DataContratacao DATE,
    Salario MONEY,
    Endereco VARCHAR(300),
    Telefone CHAR(11),
    Email VARCHAR(100)
);

CREATE TABLE Reserva (
    IDReserva INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDMaquina INT NULL,
    Horario DATETIME2 NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE RegistroDeUso (
    IDRegistroUso INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDMaquina INT NOT NULL,
    DataHoraInicio DATETIME2 NOT NULL,
    DataHoraFim DATETIME2 NOT NULL,
    ValorCobrado DECIMAL(10, 2),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE Lanchonete (
    IDItemLanchonete INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Quantidade INT
);

CREATE TABLE Manutencao (
    IDManutencao INT IDENTITY(1,1) PRIMARY KEY,
    IDMaquina INT NOT NULL,
    DataManutencao DATE NOT NULL,
    Descricao VARCHAR(100),
    Estado BIT,
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE ServicoAdicional (
    IDServicoAdicional INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    IDMaquina INT NOT NULL,
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE Comanda (
    IDComanda INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDItemLanchonete INT NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY (IDItemLanchonete) REFERENCES Lanchonete(IDItemLanchonete),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE NotaFiscal (
    IDNotaFiscal INT IDENTITY(1,1) PRIMARY KEY,
    DataVenda DATE NOT NULL,
    IDCliente INT NOT NULL,
    IDRegistroUso INT NULL,
    IDServicoAdicional INT NULL,
    IDComanda INT NULL,
    IDFuncionario INT NULL,
    Desconto DECIMAL(5, 2) NULL,
	FormaPagamento VARCHAR(50),
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDRegistroUso) REFERENCES RegistroDeUso(IDRegistroUso),
    FOREIGN KEY (IDServicoAdicional) REFERENCES ServicoAdicional(IDServicoAdicional),
    FOREIGN KEY (IDComanda) REFERENCES Comanda(IDComanda),
	FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario)
);
