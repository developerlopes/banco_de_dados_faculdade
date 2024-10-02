CREATE DATABASE sistema_faculdade;

USE sistema_faculdade;

CREATE TABLE tbl_alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE tbl_professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11) UNIQUE,
    formacao VARCHAR(100)
);

CREATE TABLE tbl_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria INT,
    coordenador VARCHAR(100)
);

CREATE TABLE tbl_materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES tbl_cursos(id_curso)
);

CREATE TABLE tbl_turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT,
    id_professor INT,
    semestre VARCHAR(10),
    FOREIGN KEY (id_materia) REFERENCES tbl_materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES tbl_professores(id_professor)
);

CREATE TABLE tbl_notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    nota DECIMAL(5, 2),
    FOREIGN KEY (id_aluno) REFERENCES tbl_alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES tbl_turmas(id_turma)
);
