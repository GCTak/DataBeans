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

CREATE TABLE Maquina (
    IDMaquina INT IDENTITY(1,1) NOT NULL PRIMARY KEY ,
    NumeroSerie CHAR(7),
    Estado VARCHAR(30),
    Tipo VARCHAR(30),
    Especificacoes VARCHAR(1000),
    FuncionarioResponsavel INT NOT NULL,
    FOREIGN KEY (FuncionarioResponsavel)REFERENCES Funcionario (IDFuncionario)
);

CREATE TABLE Reserva (
    IDReserva INT IDENTITY(1,1)NOT NULL PRIMARY KEY ,
    IDCliente INT NOT NULL,
    IDMaquina INT NOT NULL,
    Horario DATETIME2 NOT NULL,
    TempoDeReserva TIME NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE RegistroDeUso (
    IDRegistroUso INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
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
    Quantidade INT NOT NULL
);

CREATE TABLE Manutencao (
    IDManutencao INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDMaquina INT NOT NULL,
    DataManutencao DATE NOT NULL,
    Descricao VARCHAR(100),
    Estado BIT NOT NULL,
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE ServicoAdicional (
    IDServicoAdicional INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nome VARCHAR(150) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    IDMaquina INT NOT NULL,
    FOREIGN KEY (IDMaquina) REFERENCES Maquina(IDMaquina)
);

CREATE TABLE DetalheServicoAdicional (
    IDDetalhe INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDServicoAdicional INT NOT NULL,
    Quantidade INT NOT NULL,
    ValorTotal DECIMAL (10,2),
    DataPrestacao DATE NOT NULL,
    FOREIGN KEY (IDServicoAdicional) REFERENCES ServicoAdicional(IDServicoAdicional),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Comanda (
    IDComanda INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDFuncionario INT NOT NULL,
    DataVenda DATE NOT NULL,
    ValorTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario)
);

CREATE TABLE ItemComanda (
    IDItemComanda INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    IDItemLanchonete INT NOT NULL,
    IDFuncionario INT NOT NULL,
    Quantidade INT NOT NULL,
    DataVenda DATE NOT NULL,
    ValorTotalItem DECIMAL(10, 2),
    FOREIGN KEY (IDItemLanchonete) REFERENCES Lanchonete (IDItemLanchonete),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario)
);

CREATE TABLE NotaFiscal (
    IDNotaFiscal INT IDENTITY(1,1) PRIMARY KEY,
    DataVenda DATE NOT NULL,
    IDCliente INT NOT NULL,
    IDRegistroUso INT ,
    TempoUso TIME,
    ValorUso DECIMAL(10,2),
    IDServicoAdicional INT,
    ValorTotalServicoAdicional DECIMAL(10,2),
    IDComanda INT,
    QuantidadeDeItens INT,
    ValorTotalComanda DECIMAL(10,2),
    IDFuncionario INT NOT NULL,
    Desconto DECIMAL(5, 2),
    TributosTotaisIncidentes DECIMAL(10,2),
    FormaPagamento VARCHAR(50),
    Troco DECIMAL(10,2),
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDRegistroUso) REFERENCES RegistroDeUso(IDRegistroUso),
    FOREIGN KEY (IDServicoAdicional) REFERENCES ServicoAdicional(IDServicoAdicional),
    FOREIGN KEY (IDComanda) REFERENCES Comanda(IDComanda),
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario)
);
