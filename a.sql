CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO alunos (nome, turma, curso, data_nascimento)
VALUES ('Ana Lima', '1A', 'Engenharia Civil', '2002-05-10'),
       ('Bruno Souza', '1B', 'Administração', '2003-08-15'),
       ('Vinicius Silva', '1B', 'Administração', '2003-03-18'),
       ('Tiago Gomes', '2A', 'Administração', '2001-02-04'),
       ('André Silver', '3A', 'Engenharia Civil', '2000-01-27'),
       ('Cristian Guedes', '2A', 'Engenharia Da Computação', '2000-10-17'),
       ('João Xo', '2A', 'Engenharia Da Computação', '2004-05-20'),
       ('Adriana Soares', '2C', 'Engenharia Da Computação', '2003-08-01'),
       ('Felipe Soares', '2A', 'Engenharia Civil', '2002-04-07'),
       ('Adriana Soares', '1C', 'Engenharia Da Computação', '2004-04-08');

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia Civil', 5),
       ('Engenharia Da Computação', 4),
       ('Administração', 4);

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
       (2, 3),
       (3, 3),
       (4, 3),
       (5, 1),
       (6, 2),
       (7, 2),
       (8, 2),
       (9, 1),
       (10, 2);

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
--teste

