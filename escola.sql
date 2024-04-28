CREATE TABLE aluno (
	ID serial PRIMARY KEY,
  	nome VARCHAR(50) NOT NULL,
  	matricula INT not NULL UNIQUE,
  	email VARCHAR(50) not NULL,
  	endereco VARCHAR(50) not NULL,
  	telefone INT not NULL
);

SELECT * from aluno

CREATE TABLE emprestimo (
    codigo SERIAL PRIMARY KEY,
    data_emprestimo VARCHAR(20),
  	matricula_aluno INT,
  	data_devolucao VARCHAR(20),
  	CONSTRAINT fk_aluno FOREIGN KEY(matricula_aluno) REFERENCES aluno(matricula)
);


INSERT INTO emprestimo(data_emprestimo, matricula_aluno, data_devolucao) VALUES 
	('12/03/2022 | 15:25', 1234, '15/03/2022'),
    ('15/03/2022 | 14:32', 3456, '18/03/2022'),
    ('20/03/2022 | 16:45', 2345, '23/03/2022');

SELECT * FROM aluno
  INNER JOIN emprestimo
  on emprestimo.matricula_aluno = aluno.matricula
 
CREATE TABLE livro (
	cod_livro serial PRIMARY KEY,
  	titulo VARCHAR(100),
  	autor VARCHAR(30),
  	fk_cod_sessao INT,
  	CONSTRAINT fk_sessao FOREIGN KEY (fk_cod_sessao) REFERENCES sessao(cod_sessao)
);

INSERT INTO livro(titulo, autor, fk_cod_sessao) VALUES
	('Modelo Conceitual e Diagramas ER', 'Pressman, Roger S.', 3),
    ('Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', 1),
    ('Livro 3: Linguagem SQL', 'Beighley, Lynn', 2)
    

CREATE TABLE sessao (
	cod_sessao serial PRIMARY key,
  	descricao VARCHAR(100),
  	localizacao VARCHAR(30)
);

INSERT INTO sessao(descricao, localizacao) VALUES
	('Sessao1', 'Partilheira1'),
    ('Sessao2', 'Partilheira2'),
    ('Sessao3', 'Partilheira3');
    

CREATE TABLE livro_emprestimo (
	fk_cod_livro INT,
  	CONSTRAINT fk_livro FOREIGN KEY(fk_cod_livro) REFERENCES livro(cod_livro)
  	cod_emprestimo INT,
  	CONSTRAINT fk_emprestimo FOREIGN KEY(cod_emprestimo) REFERENCES emprestimo(codigo)
);

INSERT into livro_emprestimo(fk_cod_emprestimo) VALUES	
	(1),
    (3),
    (2);

SELECT * FROM livro_emprestimo
  INNER JOIN emprestimo
  on livro_emprestimo.codigo_emprestimo = emprestimo.codigo