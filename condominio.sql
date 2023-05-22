CREATE DATABASE db_condominio;

USE db_condominio;

CREATE TABLE Pessoa (
	id_pessoa INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	biometria BOOLEAN,
	PRIMARY KEY (id_pessoa)
);

CREATE TABLE Cargo(
	Cod_Cargo INT NOT NULL,
	NmCargo VARCHAR(30),
	PRIMARY KEY (Cod_Cargo)
);

CREATE TABLE Funcionario (
	Cod_Func INT NOT NULL,
	FK_id_pessoa INT NOT NULL,
	FK_Cod_Cargo INT NOT NULL,
	CPF VARCHAR(11),
	CNPJ VARCHAR(14),
	salario DECIMAL(6,2) NOT NULL,
	acesso_geral BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (Cod_Func),
	FOREIGN KEY (FK_id_pessoa) REFERENCES Pessoa(id_pessoa),
	FOREIGN KEY (FK_Cod_Cargo) REFERENCES Cargo(Cod_Cargo)
);

CREATE TABLE Avisos (
	Id_aviso INT NOT NULL,
	texto TEXT NOT NULL,
	FK_Cod_Func INT NOT NULL,
	PRIMARY KEY (id_aviso),
	FOREIGN KEY (FK_Cod_Func) REFERENCES Funcionario(Cod_Func)
);

CREATE TABLE Morador(
	CPF VARCHAR(11) NOT NULL,
	FK_Id_Pessoa INT NOT NULL,
	PRIMARY KEY (CPF),
	FOREIGN KEY (FK_Id_Pessoa) REFERENCES Pessoa(Id_Pessoa)
);

CREATE TABLE Dependete(
	Id_dep INT NOT NULL,
	FK_id_pessoa INT NOT NULL,
	FK_responsavel VARCHAR(11) NOT NULL,
	CPF VARCHAR(11),
	idade DATE,
	PRIMARY KEY (Id_dep),
	FOREIGN KEY (FK_id_pessoa) REFERENCES Pessoa(id_pessoa),
	FOREIGN KEY (FK_responsavel) REFERENCES Morador(CPF)
);

CREATE TABLE Estacionamento (
	Cod_Vaga INT NOT NULL,
	PRIMARY KEY (Cod_Vaga)
);

CREATE TABLE Apartamento(
	Cod_Ap INT NOT NULL,
	numero INT NOT NULL,
	bloco INT NOT NULL,
	andar INT NOT NULL,
	PRIMARY KEY (Cod_Ap)
);

CREATE TABLE Morador_Estacionamento_Apartamento(
	FK_CPF VARCHAR(11) NOT NULL,
	FK_Cod_Ap INT NOT NULL,
	FK_Cod_Vaga INT NOT NULL,
	FOREIGN KEY (FK_CPF) REFERENCES Morador(CPF),
	FOREIGN KEY (FK_Cod_Ap) REFERENCES Apartamento(Cod_Ap),
	FOREIGN KEY (FK_Cod_Vaga) REFERENCES Estacionamento(Cod_Vaga)
);

CREATE TABLE Ordem_de_Serviço (
	id_os INT NOT NULL,
	FK_CPF VARCHAR(11) NOT NULL,
	`data` DATE,
	informacoes TEXT NOT NULL,
	PRIMARY KEY (id_os),
	FOREIGN KEY (FK_CPF) REFERENCES Morador(CPF)	
);

CREATE TABLE Reserva (
	id_reserva INT NOT NULL,
	FK_CPF VARCHAR(11) NOT NULL,
	FK_id_local INT NOT NULL,
	`data` DATETIME,
	PRIMARY KEY (id_reserva),
	FOREIGN KEY (FK_CPF) REFERENCES Morador(CPF),
	FOREIGN KEY (FK_id_local) REFERENCES `Local`(id_local)
);

CREATE TABLE `Local` (
	id_local INT NOT NULL,
	NmLocal VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_local)
);

CREATE TABLE Financeiro(
	Id_financeiro INT NOT NULL,
	FK_CPF VARCHAR(11) NOT NULL,
	Contas BLOB NOT NULL,
	PRIMARY KEY (Id_Financeiro),
	FOREIGN KEY (FK_CPF) REFERENCES Morador(CPF)
);


