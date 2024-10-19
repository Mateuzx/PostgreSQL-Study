-- Desafio 1: Selecionar todos os usuários cujo nome começa com a letra "A".
SELECT * FROM tb_usuarios WHERE nome_usuario LIKE 'A%';

-- Desafio 2: Selecionar todos os livros publicados após o ano 2010.
SELECT * FROM tb_livros where ano_livro > 1996;

-- Desafio 3: Contar quantos usuários têm mais de 30 anos.
SELECT COUNT(*) FROM tb_usuarios where idade_usuario >25;

-- Desafio 4: Contar quantos usuários têm mais de 30 anos.
SELECT nome_usuario, telefone_usuario from tb_usuarios;

-- Desafio 5: Selecionar todos os livros cujo título contém a palavra "Guerra".
SELECT * FROM tb_livros where titulo_livro LIKE '%Guerra%';

-- Desafio 6: Selecionar todos os livros emprestados pelo usuário "Alice".
SELECT u.nome_usuario, l.titulo_livro as titulo_emprestimo, e.data_emprestimo, e.data_devolucao FROM tb_livros l
	JOIN tb_emprestimos e on l.pk_livro = e.fk_livro
	JOIN tb_usuarios u on e.fk_usuario = u.pk_usuario where u.nome_usuario='Alice';

-- Desafio 7: Selecionar os títulos dos livros e os nomes de seus autores.
SELECT l.titulo_livro, a.nome_autor FROM tb_livros l JOIN tb_autores a on l.fk_autor = a.pk_autor;

-- Desafio 8: Selecionar o nome dos usuários e a data de empréstimo dos livros que ainda não foram devolvidos (data_devolucao é NULL).
SELECT u.nome_usuario, e.data_emprestimo FROM tb_emprestimos e join tb_usuarios u on e.fk_usuario = u.pk_usuario where e.data_devolucao is null;

-- Desafio 9: Selecionar os títulos dos livros e a quantidade de vezes que cada um foi emprestado.
SELECT l.titulo_livro, COUNT(e.fk_livro) as qntd_vezes_emprestado FROM tb_emprestimos e join tb_livros l on e.fk_livro = l.pk_livro group by l.titulo_livro

-- Desafio 10: Selecionar os autores que possuem mais de 1 livros publicados.
SELECT nome_autor, count(l.fk_autor) as qntd_livros_publicados from tb_autores a join tb_livros l on a.pk_autor = l.fk_autor GROUP by a.nome_autor HAVING count (a.nome_autor)>1

-- Desafio 11: Selecionar os autores cujos livros nunca foram emprestados.
select a.nome_autor from tb_autores a join tb_livros l on a.pk_autor = l.fk_autor left join tb_emprestimos e on l.pk_livro = e.fk_livro where e.fk_livro is null

-- Desafio 12: Selecionar os livros que foram emprestados pelo maior número de vezes em um determinado período.	
select l.titulo_livro, count(e.pk_emprestimo) as qntd_emprestimos from tb_livros l join tb_emprestimos e on l.pk_livro = e.fk_livro where e.data_emprestimo between '2023-07-05' and '2023-08-12'
group by l.titulo_livro ORDER by qntd_emprestimos desc LIMIT 1

-- Desafio 13: Selecionar os autores que possuem pelo menos um livro emprestado a cada usuário.
-- Preciso dos altores presente em emprestimos pelos fk de livro, agrupar por autores com um count > 1

select * from tb_autores a 
	join tb_livros l on a.pk_autor = l.fk_autor
	join tb_emprestimos e on l.pk_livro = e.fk_livro
	join tb_usuarios u on e.fk_usuario = u.pk_usuario
	
	--GROUP by a.nome_autor
	




select*from tb_autores;
select*from tb_usuarios;
select*from tb_emprestimos;
select*from tb_livros;
select*from tb_categorias;
SELECT*from tb_livros_categorias;