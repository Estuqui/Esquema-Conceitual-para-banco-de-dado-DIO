CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Selecionar ou criar o banco de dados
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Remover tabelas se existirem antes de criar novamente
DROP TABLE IF EXISTS Equipe_Mecanico, Equipe_OS, OS_Servico, OS_Peca, Servico_Mecanico, Veiculo, Ordem_Servico, Mecanico, Equipe, Servico, Peca, Cliente;

-- Criar a tabela Cliente primeiro
CREATE TABLE Cliente (
    IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);

-- Agora criar Veiculo, garantindo que o tipo de id_cliente é INT
CREATE TABLE Veiculo (
    IdVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    IdCliente INT NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente) ON DELETE CASCADE
);

CREATE TABLE OrdemServico (
    IdOs INT AUTO_INCREMENT PRIMARY KEY,
    DataEmissao DATE NOT NULL,
    ValorTotal DECIMAL(10,2),
    status ENUM('Pendente', 'Em Andamento', 'Concluído') NOT NULL,
    DataConclusao DATE,
    IdVeiculo INT NOT NULL,
    FOREIGN KEY (IdVeiculo) REFERENCES Veiculo(IdVeiculo) ON DELETE CASCADE
);

CREATE TABLE Mecanico (
    IdMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    especialidade VARCHAR(50)
);

CREATE TABLE Equipe (
    IdEquipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Servico (
    IdServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    ValorMaoDeObra DECIMAL(10,2) NOT NULL
);

CREATE TABLE Peca (
    IdPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Relacionamentos
CREATE TABLE EquipeMecanico (
    IdEquipe INT,
    IdMecanico INT,
    PRIMARY KEY (IdEquipe, IdMecanico),
    FOREIGN KEY (IdEquipe) REFERENCES Equipe(IdEquipe) ON DELETE CASCADE,
    FOREIGN KEY (IdMecanico) REFERENCES Mecanico(IdMecanico) ON DELETE CASCADE
);

CREATE TABLE EquipeOS (
    IdEquipe INT,
    IdOs INT,
    PRIMARY KEY (IdEquipe, IdOs),
    FOREIGN KEY (IdEquipe) REFERENCES Equipe(IdEquipe) ON DELETE CASCADE,
    FOREIGN KEY (IdOs) REFERENCES OrdemServico(IdOs) ON DELETE CASCADE
);

CREATE TABLE OSServico (
    IdOs INT,
    IdServico INT,
    PRIMARY KEY (IdOs, IdServico),
    FOREIGN KEY (IdOs) REFERENCES OrdemServico(IdOs) ON DELETE CASCADE,
    FOREIGN KEY (IdServico) REFERENCES Servico(IdServico) ON DELETE CASCADE
);

CREATE TABLE OSPeca (
    IdOs INT,
    IdPeca INT,
    PRIMARY KEY (IdOs, IdPeca),
    FOREIGN KEY (IdOs) REFERENCES OrdemServico(IdOs) ON DELETE CASCADE,
    FOREIGN KEY (IdPeca) REFERENCES Peca(IdPeca) ON DELETE CASCADE
);

CREATE TABLE ServicoMecanico (
    IdServico INT,
    IdMecanico INT,
    PRIMARY KEY (IdServico, IdMecanico),
    FOREIGN KEY (IdServico) REFERENCES Servico(IdServico) ON DELETE CASCADE,
    FOREIGN KEY (IdMecanico) REFERENCES Mecanico(IdMecanico) ON DELETE CASCADE
);