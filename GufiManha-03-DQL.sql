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
