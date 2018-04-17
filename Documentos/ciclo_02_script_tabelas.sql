drop table responsavel;

﻿alter table aluno 
    add nome_responsavel varchar(70),
    add email_responsavel varchar(40) not null,
    add cpf_responsavel varchar(11) not null,
	add rg_responsavel varchar(11),
    add telefone_responsavel varchar(10),
    add celular_responsavel varchar(11) not null;

create table perfil_usuario (
	id bigint(10) primary key auto_increment,
    nome varchar(70) not null
) engine=innodb default charset=utf8;

create table usuario (
	id bigint(10) primary key auto_increment,
    login varchar(15) not null,
    nome varchar(70) not null,
    fk_perfil_usuario_id bigint(10) not null,
    senha varchar(15) not null,
	ativo varchar(01) not null default 's',
		
	foreign key (fk_perfil_usuario_id) references perfil_usuario(id)
    
) engine=innodb default charset=utf8;

alter table aluno
modify complemento varchar(20);

alter table frequencia 
drop foreign key frequencia_ibfk_1;

alter table aluno
modify id bigint(10) auto_increment;

alter table frequencia
add foreign key (fk_aluno_id) references aluno(id);

alter table frequencia
add hora_frequencia varchar(04) not null default '0000';

alter table usuario
add unique usuario_login_unique_index (login);

insert into perfil_usuario (nome) values('Gerente');
insert into perfil_usuario (nome) values('Comum');

insert into usuario (login, nome, fk_perfil_usuario_id, senha, ativo) values('andrecleiser', 'André Cleiser Lopes da Silva', 1, 'MTIzNDU2', 'S');
insert into usuario (login, nome, fk_perfil_usuario_id, senha, ativo) values('silvana', 'Silvana', 1, 'MTIzNDU2', 'S');
insert into usuario (login, nome, fk_perfil_usuario_id, senha, ativo) values('rafaela', 'Rafaela', 1, 'MTIzNDU2', 'S');
