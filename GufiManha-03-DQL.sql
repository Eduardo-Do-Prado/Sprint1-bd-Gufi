SELECT Nome, Email, TituloTipoUsuario, DataCadastro, Genero FROM Usuario
INNER JOIN TipoUsuario ON Usuario.IdTipousuario = TipoUsuario.IdTipoUsuario

SELECT CNPJ, NomeFantasia, Endereco FROM Instituicao;

SELECT TituloTipoEvento FROM TipoEvento;

SELECT NomeEvento, TituloTipoEvento, DataEvento, AcessoLivre, Descricao, NomeFantasia, CNPJ, Endereco FROM Evento
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao;

SELECT  NomeEvento, TituloTipoEvento, DataEvento, AcessoLivre, Descricao, NomeFantasia, CNPJ, Endereco FROM Evento 
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
WHERE AcessoLivre = 1;

SELECT NomeEvento, TituloTipoEvento, DataEvento, AcessoLivre, Descricao, NomeFantasia, CNPJ, Endereco, Nome, Email, DataCadastro, Genero FROM Presenca 
INNER JOIN Usuario ON Presenca.IdUsuario = Usuario.IdUsuario
INNER JOIN Evento ON Presenca.IdEvento = Evento.IdEvento
INNER JOIN Instituicao ON Instituicao.IdInstituicao = Evento.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
WHERE Usuario.IdUsuario = 2;


--EXTRAS
SELECT NomeEvento, TituloTipoEvento, DataEvento, (CASE WHEN AcessoLivre=1 THEN 'Publico' ELSE 'Privado' END) as AcessoLivre, Descricao, NomeFantasia, CNPJ, Endereco FROM Evento
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao;

SELECT NomeEvento, TituloTipoEvento, DataEvento, AcessoLivre, Descricao, NomeFantasia, CNPJ, Endereco, Nome, Email, DataCadastro, Genero, Situacao FROM Presenca 
INNER JOIN Usuario ON Presenca.IdUsuario = Usuario.IdUsuario
INNER JOIN Evento ON Presenca.IdEvento = Evento.IdEvento
INNER JOIN Instituicao ON Instituicao.IdInstituicao = Evento.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
WHERE Usuario.IdUsuario = 2 AND Presenca.Situacao = 'Confirmada';

CREATE DATABASE Aposentadoria 

CREATE TABLE StatusAP (
--COD = ID
 Cod INT PRIMARY KEY IDENTITY,
 Nome VARCHAR(40),
 Aposentado BIT NOT NULL
);

--Ele se comporta como um tipo inteiro, por�m com o intervalo de valores
--poss�veis restrito a 0 e 1 (e NULL, se n�o for usada uma restri��o NOT
--NULL ao criar o campo). 

--qualquer valor diferente de zero ser� interpretado como um.

INSERT INTO StatusAP VALUES
('Jo�o', 1),
('Marta', 0),
('Renan', 0),
('F�bio', 0),
('Ana', 0),
('Am�lia', 1);

--fazemos nossa primeira consulta para saber quais usu�rios est�o aposentados:

SELECT Nome
FROM StatusAP
WHERE Aposentado = 1;

--palavras-chave TRUE e FALSE s�o interpretados respectivamente como os bits 1 e 0

INSERT INTO StatusAP VALUES
('Renata', 'Aposentado'),
('Monica', 'N�o Aposentado');

SELECT*FROM StatusAP;

SELECT * FROM TipoUsuario
SELECT * FROM TipoEvento
SELECT * FROM Instituicao
SELECT * FROM Presenca
SELECT * FROM Usuario
SELECT * FROM Evento
