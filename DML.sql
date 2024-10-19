-- INSERT --

INSERT INTO TB_AUTORES (PK_AUTOR,NOME_AUTOR,NACIONALIDADE_AUTOR) VALUES (1, 'J.K ROWLING', 'Britânica');
INSERT INTO TB_AUTORES (PK_AUTOR,NOME_AUTOR,NACIONALIDADE_AUTOR) VALUES (2, 'George R.R. Martin', 'Americana');
INSERT INTO TB_AUTORES (PK_AUTOR,NOME_AUTOR,NACIONALIDADE_AUTOR) VALUES (3, 'J.R.R Tolkien', 'Britânica');
INSERT INTO TB_AUTORES (PK_AUTOR,NOME_AUTOR,NACIONALIDADE_AUTOR) VALUES (4, 'Clarice Lispector', 'Brasileira');

SELECT * FROM TB_AUTORES;

INSERT INTO TB_LIVROS (PK_LIVRO,TITULO_LIVRO,FK_AUTOR,ANO_LIVRO,GENERO_LIVRO) VALUES (1, 'Harry Potter e a Pedra Filosofal', 1, '1997', 'Fantasia');
INSERT INTO TB_LIVROS (PK_LIVRO,TITULO_LIVRO,FK_AUTOR,ANO_LIVRO,GENERO_LIVRO) VALUES (2, 'Harry Potter e a Câmara Secreta', 1, '1998', 'Fantasia');
INSERT INTO TB_LIVROS (PK_LIVRO,TITULO_LIVRO,FK_AUTOR,ANO_LIVRO,GENERO_LIVRO) VALUES (3, 'A Guerra dos Tronos', 2, '1996', 'Fantasia');
INSERT INTO TB_LIVROS (PK_LIVRO,TITULO_LIVRO,FK_AUTOR,ANO_LIVRO,GENERO_LIVRO) VALUES (4, 'O Senhor dos Anéis: A Sociedade do Anel', 3, '1954', 'Fantasia');
INSERT INTO TB_LIVROS (PK_LIVRO, TITULO_LIVRO, FK_AUTOR, ANO_LIVRO, GENERO_LIVRO) VALUES (5, 'A Hora da Estrela', 4, '1977', 'Ficção');


SELECT * FROM TB_LIVROS;

INSERT INTO TB_USUARIOS (PK_USUARIO,NOME_USUARIO,ENDERECO_USUARIO,TELEFONE_USUARIO,IDADE_USUARIO) VALUES (1, 'Alice', 'Rua A,123', '1112345678',23);
INSERT INTO TB_USUARIOS (PK_USUARIO,NOME_USUARIO,ENDERECO_USUARIO,TELEFONE_USUARIO,IDADE_USUARIO) VALUES (2, 'Bob', 'Rua B, 456', '1187654321',30);
INSERT INTO TB_USUARIOS (PK_USUARIO,NOME_USUARIO,ENDERECO_USUARIO,TELEFONE_USUARIO,IDADE_USUARIO) VALUES (3, 'Roberto', 'Rua B, 456', '1143128769',35);

SELECT * FROM TB_USUARIOS;

INSERT INTO TB_EMPRESTIMOS (PK_EMPRESTIMO,FK_LIVRO,FK_USUARIO,DATA_EMPRESTIMO,DATA_DEVOLUCAO) VALUES (1,1,1,'2023-07-01','2023-07-15');
INSERT INTO TB_EMPRESTIMOS (PK_EMPRESTIMO,FK_LIVRO,FK_USUARIO,DATA_EMPRESTIMO,DATA_DEVOLUCAO) VALUES (2,3,2,'2023-07-05','2023-07-19');
INSERT INTO TB_EMPRESTIMOS (PK_EMPRESTIMO,FK_LIVRO,FK_USUARIO,DATA_EMPRESTIMO,DATA_DEVOLUCAO) VALUES (3,1,3,'2023-08-12',null);
INSERT INTO TB_EMPRESTIMOS (PK_EMPRESTIMO,FK_LIVRO,FK_USUARIO,DATA_EMPRESTIMO,DATA_DEVOLUCAO) VALUES (4,1,3,'2023-07-23',null);
INSERT INTO TB_EMPRESTIMOS (PK_EMPRESTIMO,FK_LIVRO,FK_USUARIO,DATA_EMPRESTIMO,DATA_DEVOLUCAO) VALUES (5,1,2,'2023-07-24',null);



SELECT * FROM TB_EMPRESTIMOS;
drop table tb_emprestimos

INSERT INTO TB_CATEGORIAS (PK_CATEGORIA,NOME_CATEGORIA) VALUES (1, 'Fantasia');
INSERT INTO TB_CATEGORIAS (PK_CATEGORIA,NOME_CATEGORIA) VALUES (2, 'Aventura');

SELECT * FROM TB_CATEGORIAS;

INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (1,1);
INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (1,2);
INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (2,1);
INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (3,1);
INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (4,1);
INSERT INTO TB_LIVROS_CATEGORIAS (FK_LIVRO, FK_CATEGORIA) VALUES (4,2);

-- UPDATE --

-- Desafio 1: Atualizar o Telefone de um Usuário
UPDATE TB_USUARIOS SET TELEFONE_USUARIO = '11111111' WHERE NOME_USUARIO = 'Alice';

-- Desafio 2: Atualizar o Ano de Publicação de um Livro
UPDATE TB_LIVROS SET ANO_LIVRO = '2001' WHERE TITULO_LIVRO = 'Harry Potter e a Pedra Filosofal';

-- Desafio 3: Atualizar a Nacionalidade de um Autor
UPDATE TB_AUTORES SET NACIONALIDADE_AUTOR = 'Brasileiro' WHERE NOME_AUTOR = 'George R.R. Martin';

-- Desafio 4: Atualizar a Data de Devolução de um Empréstimo
UPDATE TB_EMPRESTIMOS SET DATA_DEVOLUCAO =  '2023-07-25' where pk_emprestimo in(
	SELECT pk_emprestimo from tb_emprestimos as em 
		join tb_usuarios as usua on em.fk_usuario = usua.pk_usuario
		join tb_livros as livr on em.fk_livro = livr.pk_livro
		WHERE usua.nome_usuario = 'Bob'
		and livr.titulo_livro = 'A Guerra dos Tronos'
);

-- Desafio 5: Atualizar o Gênero de um Livro (Parei aqui)
UPDATE tb_livros SET genero_livro = 'Aventura Épica' where titulo_livro = 'O Senhor dos Anéis: A Sociedade do Anel';

-- Desafio 6: Atualizar o Endereço de um Usuário
UPDATE tb_usuarios SET endereco_usuario = 'Rua Nova, 789' where pk_usuario=2;

--Desafio 7: Atualizar a Categoria de um Livro
insert into tb_categorias (pk_categoria,nome_categoria) values (3, 'Mistério');

UPDATE tb_livros_categorias set fk_categoria = '3' where fk_livro in (
	select pk_livro from tb_livros where titulo_livro = 'Harry Potter e a Câmara Secreta'
);
	
-- Desafio 8: Atualizar o Nome de um Autor
UPDATE tb_autores SET nome_autor = 'John R.R. Tolkien' where nome_autor = 'J.R.R Tolkien';

-- Desafio 9: Atualizar Todos os Livros de um Autor para um Novo Ano de Publicação
UPDATE tb_livros L
SET ano_livro = 2000
FROM tb_autores A
WHERE L.fk_autor = A.pk_autor
  AND A.pk_autor = 1;


-- Alguns casos como esse acima podem variar o script entre PostgreSQL e MySQL por exemplo no MySQL ficaria:
UPDATE tb_livros
INNER JOIN tb_autores ON tb_livros.fk_autor = tb_autores.pk_autor
SET tb_livros.ano_livro = 2000
WHERE tb_autores.pk_autor = 1;


SELECT U.nome_usuario, L.titulo_livro, E.data_emprestimo
FROM tb_emprestimos E
INNER JOIN tb_usuarios U ON E.fk_usuario = U.pk_usuario
INNER JOIN tb_livros L ON E.fk_livro = L.pk_livro;


-- Desafio 10: Atualizar o Nome de uma Categoria
UPDATE tb_categorias set nome_categoria = 'Aventura e Ação' where nome_categoria = 'Aventura';
	
select*from tb_autores;
select*from tb_usuarios;
select*from tb_autores;
select*from tb_emprestimos;
select*from tb_livros;
select*from tb_categorias;
SELECT*from tb_livros_categorias;
