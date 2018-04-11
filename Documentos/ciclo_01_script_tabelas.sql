CREATE SCHEMA `sgesc` DEFAULT CHARACTER SET utf8;
drop table frequencia;
drop table responsavel;
drop table aluno;
drop table motivo_matricula;
drop table doenca_pre_existente;


CREATE TABLE doenca_pre_existente (
	id BIGINT(4) PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE motivo_matricula (
	id BIGINT(4) PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE aluno (
	id BIGINT(10) NOT NULL PRIMARY KEY,
	nome VARCHAR(70) NOT NULL,
	data_nascimento DATE NOT NULL,
    rua VARCHAR(60),
    complemento VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(50),
    estado VARCHAR(02),
    cep VARCHAR(8),
    telefone VARCHAR(10),
    celular VARCHAR(11),
	nome_pai VARCHAR(70),
	nome_mae VARCHAR(70),
    data_cadastramento DATE NOT NULL,
    data_inativacao DATE,
	observacao VARCHAR(200),
    fk_motivo_matricula_id BIGINT(4) NOT NULL,
    fk_doenca_pre_existente_id BIGINT(4) NOT NULL,
    adimplente VARCHAR(01) NOT NULL DEFAULT 'N',
    
	FOREIGN KEY (fk_doenca_pre_existente_id) REFERENCES doenca_pre_existente(id),
	FOREIGN KEY (fk_motivo_matricula_id) REFERENCES motivo_matricula(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE responsavel (
	id BIGINT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    fk_aluno_id BIGINT(10) NOT NULL,
    email VARCHAR(40) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
	rg VARCHAR(11),
    telefone VARCHAR(10),
    celular VARCHAR(11) NOT NULL,

	FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE frequencia (
	fk_aluno_id BIGINT(10) NOT NULL,
    data_frequencia DATE NOT NULL,

	PRIMARY KEY(fk_aluno_id, data_frequencia),
	 
	FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO doenca_pre_existente (nome) values ('Não apresenta');
INSERT INTO doenca_pre_existente (nome) values ('Hipertensão');
INSERT INTO doenca_pre_existente (nome) values ('Colesterol alterado');
INSERT INTO doenca_pre_existente (nome) values ('Osteoporose');
INSERT INTO doenca_pre_existente (nome) values ('Artrose');
INSERT INTO doenca_pre_existente (nome) values ('Desvios de coluna vertebral');
INSERT INTO doenca_pre_existente (nome) values ('Bursite');
INSERT INTO doenca_pre_existente (nome) values ('Tendinite');
INSERT INTO doenca_pre_existente (nome) values ('Doenças no Sistema Nervoso');
INSERT INTO doenca_pre_existente (nome) values ('Luxação em alguma articulação');

INSERT INTO motivo_matricula (descricao) values ('Indicação médica');
INSERT INTO motivo_matricula (descricao) values ('Lazer');
INSERT INTO motivo_matricula (descricao) values ('Aprendizagem');
INSERT INTO motivo_matricula (descricao) values ('Sociabilização');
INSERT INTO motivo_matricula (descricao) values ('Condicionamento Físico');
INSERT INTO motivo_matricula (descricao) values ('Concurso');