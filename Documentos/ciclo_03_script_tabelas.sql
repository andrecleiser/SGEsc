create table professor (
	id bigint(10) primary key auto_increment,
    nome varchar(70) not null
) engine=innodb default charset=utf8;

create table turma (
	id bigint(10) primary key auto_increment,
    descricao varchar(40) not null,
    controlar_horario varchar(01) not null default 'S',
    fk_perfil_professor_id bigint(10) not null,
    hora_inicio varchar(4),
	hora_fim varchar(4),
	valor_sugerido double(7, 2) not null,
	limite_alunos bigint(2),
	
	foreign key (fk_perfil_professor_id) references professor(id)
    
) engine=innodb default charset=utf8;

create table pagamento (
	id bigint(10) primary key auto_increment,
    fk_aluno_id bigint(10) not null,
    fk_turma_id bigint(10) not null,
	valor double(7, 2) not null,
	ano bigint(4) not null,
	mes bigint(2) not null,
    observacao varchar(100) not null,
		
	foreign key (fk_aluno_id) references aluno(id),
	foreign key (fk_turma_id) references turma(id)

) engine=innodb default charset=utf8;

create table turma_aluno (
    fk_aluno_id bigint(10) not null,
    fk_turma_id bigint(10) not null,

	foreign key (fk_aluno_id) references aluno(id),
	foreign key (fk_turma_id) references turma(id),

	constraint pk_turma_aluno PRIMARY KEY (fk_turma_id, fk_aluno_id)
) engine=innodb default charset=utf8;

ALTER TABLE aluno
ADD INDEX `idx_nome` (`nome` ASC);