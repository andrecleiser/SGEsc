
delete from turma_aluno where fk_aluno_id > 0;
delete from turma where id >0;
delete from professor where id > 0;

alter table turma AUTO_INCREMENT = 1;
alter table professor AUTO_INCREMENT = 1;

/* INCLUSÃO DOS PROFESSORES */
insert into professor (nome) values ('ALESSANDRA');
insert into professor (nome) values ('CAMILA BARBOSA');
insert into professor (nome) values ('CAMILA SANTIAGO');
insert into professor (nome) values ('NATHÁLIA MESQUITA');
insert into professor (nome) values ('ROSA');
insert into professor (nome) values ('SILVANA');
insert into professor (nome) values ('WALLACE');
insert into professor (nome) values ('PHILIPE');

/*CRIA AS TURMAS */
	 
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - TERÇA E QUINTA', 'S', 7, '0800', '0840', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - TERÇA E QUINTA', 'S', 7, '0845', '0925', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - TERÇA E QUINTA', 'S', 7, '0930', '1010', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - QUARTA E SEXTA', 'S', 7, '0800', '0840', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - QUARTA E SEXTA', 'S', 7, '0845', '0925', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - QUARTA E SEXTA', 'S', 7, '0930', '1010', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - SEGUNDA E QUARTA', 'S', 7, '1445', '1525', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - SEGUNDA E QUARTA', 'S', 7, '1530', '1610', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - SEGUNDA E QUARTA', 'S', 7, '1615', '1655', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('WALLACE - SEGUNDA E QUARTA', 'S', 7, '1700', '1740', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '0815', '0840', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '0845', '0925', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '0930', '1010', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '1445', '1510', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '1515', '1555', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATHÁLIA - TERÇA E QUINTA', 'S', 4, '1600', '1640', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - SEGUNDA E QUARTA', 'S', 3, '1600', '1640', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - SEGUNDA E QUARTA', 'S', 3, '1645', '1725', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - SEGUNDA E QUARTA', 'S', 3, '1730', '1810', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - TERÇA E QUINTA', 'S', 3, '1400', '1425', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - TERÇA E QUINTA', 'S', 3, '1430', '1455', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - TERÇA E QUINTA', 'S', 3, '1500', '1525', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - TERÇA E QUINTA', 'S', 3, '1530', '1555', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA SANTIAGO - TERÇA E QUINTA', 'S', 3, '1600', '1625', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA BARBOSA - QUARTA E SEXTA', 'S', 2, '0800', '0840', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA BARBOSA - QUARTA E SEXTA', 'S', 2, '0845', '0925', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('CAMILA BARBOSA - QUARTA E SEXTA', 'S', 2, '0930', '1010', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('ALESSANDRA - TERÇA E QUINTA', 'S', 1, '1400', '1440', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('ALESSANDRA - TERÇA E QUINTA', 'S', 1, '1445', '1525', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('ALESSANDRA - TERÇA E QUINTA', 'S', 1, '1530', '1610', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('ALESSANDRA - TERÇA E QUINTA', 'S', 1, '1615', '1645', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('ROSA - SEGUNDA E QUARTA', 'S', 1, '1430', '1510', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '0900', '0940', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '0945', '1025', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '1430', '1455', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '1500', '1525', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '1530', '1610', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '1615', '1640', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - TERÇA E QUINTA', 'S', 6, '1645', '1725', 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - SEGUNDA E QUARTA', 'S', 6, '1430', '1455', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - SEGUNDA E QUARTA', 'S', 6, '1500', '1525', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - SEGUNDA E QUARTA', 'S', 6, '1530', '1555', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - SEGUNDA E QUARTA', 'S', 6, '1600', '1640', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('SILVANA - SEGUNDA E QUARTA', 'S', 6, '1645', '1725', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('PHILIPE - SEGUNDA E QUARTA', 'S', 8, '1700', '1740', 120, 30);

insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('COLÔMIA DE FÉRIAS - 2018.2', 'S', 6, '0800', '1140', 260, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('COLÔMIA DE FÉRIAS - 2018.2', 'S', 6, '1400', '1740', 260, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('HIDROGINÁSTICA', 'N', 6, NULL, NULL, 120, 30);
	   
insert into turma (descricao, controlar_horario, fk_perfil_professor_id, hora_inicio, hora_fim, valor_sugerido, limite_alunos)
	   values ('NATAÇÃO', 'N', 6, NULL, NULL, 120, 30);

/* RELACIONADA TURMA E ALUNO */	   
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 548);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 136);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 138);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 140);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 141);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 142);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 143);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 549);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 550);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 552);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 137);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 139);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (1, 547);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 107);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 108);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 109);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 110);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 111);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 112);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 113);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 114);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 115);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 116);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 117);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 118);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 146);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 147);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 148);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 149);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 150);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 152);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 153);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 154);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 155);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 156);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 157);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 158);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 553);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 555);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 608);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 609);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 633);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 654);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (2, 151);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 556);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 551);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 557);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 574);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 575);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 576);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 577);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 578);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 580);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 607);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 610);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 612);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (3, 573);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 80);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 81);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 82);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 83);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 85);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 87);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 88);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 89);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 90);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (7, 86);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 119);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 121);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 123);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 124);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 126);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 127);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 128);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 129);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 130);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 145);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 511);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 565);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 624);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 120);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 122);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 125);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 131);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (8, 132);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 65 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 66 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 67 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 68 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 69 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 71 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 72 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 74 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 77 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 78 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 79 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 84 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 144);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 234);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 76 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 622);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (9, 558);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 75 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 91 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 92 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 93 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 133);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 134);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (10, 135);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (11, 256);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 579);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 270);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 257);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 258);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 259);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 260);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 261);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 262);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 263);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 265);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (12, 266);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (13, 572);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (13, 264);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (13, 267);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (13, 268);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (13, 269);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (14, 240);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (14, 241);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (14, 242);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (14, 243);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 591);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 225);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 226);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 227);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 228);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 229);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 230);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 231);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 232);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 233);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 235);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 236);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 237);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 238);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 239);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 249);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 276);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (15, 277);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 64 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 73 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 244);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 247);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 248);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 250);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 251);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 252);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 253);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 254);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 255);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (16, 246);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 103);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 292);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 293);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 294);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 296);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 298);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 299);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 300);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 301);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 302);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 303);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 306);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 308);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 313);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 314);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (18, 315);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (19, 106);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (19, 286);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 274);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 281);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 283);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 566);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 104);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 272);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 273);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 275);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 278);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 279);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 280);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 282);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 291);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 297);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (20, 309);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (21, 95 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (21, 96 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (21, 97 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (21, 290);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (21, 295);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (22, 25 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (22, 569);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (23, 101);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (23, 100);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (23, 102);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 284);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 105);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 289);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 304);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 305);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 307);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 310);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 311);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 312);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (24, 590);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (25, 220);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (25, 221);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (26, 222);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (26, 223);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (26, 224);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (27, 216);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (27, 217);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (27, 218);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (27, 219);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 171);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 174);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 175);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 177);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 178);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 180);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 181);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 182);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 183);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (28, 635);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 173);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 184);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 185);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 186);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 187);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 188);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 189);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 190);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 191);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 192);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 193);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (29, 619);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 160);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 161);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 162);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 163);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 165);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 166);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 167);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 168);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 169);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 170);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 176);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 179);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (30, 636);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 194);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 195);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 196);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 197);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 198);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 199);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 200);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 201);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 202);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 203);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (31, 204);
           
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 59 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 60 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 61 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 208);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 209);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 210);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 213);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 214);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (32, 215);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 47);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 48);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 49);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 50);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 51);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 52);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 54);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 62);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 63);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (33, 53);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (34, 55);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (34, 56);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (34, 57);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (34, 58);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (35, 584);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (35, 172);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (35, 22 );

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 19 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 21 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 23 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 24 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 581);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 583);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (36, 613);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 15 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 18 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 28 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 29 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 30 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 33 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 34 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 35 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 36 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 37 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 38 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 70 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 287);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 541);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 542);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 623);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 17 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 31 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (37, 32 );

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (38, 27 );

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 20 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 40 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 41 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 42 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 43 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 44 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 45 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 46 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 94 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 543);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 589);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 620);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 630);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 658);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (39, 582);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (43, 26);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (45, 206);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (45, 207);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (45, 205);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (46, 629);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (46, 637);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (46, 643);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (46, 652);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 655);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 614);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 626);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 618);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 621);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 625);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 631);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 632);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 634);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 642);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 644);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 646);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 648);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 649);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 650);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 651);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 653);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 657);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 617);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (47, 647);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 539);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 98 );
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 164);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 316);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 317);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 318);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 320);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 321);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 322);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 323);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 324);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 325);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 326);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 327);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 328);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 329);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 330);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 331);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 332);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 333);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 334);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 335);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 336);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 337);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 338);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 339);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 340);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 341);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 342);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 343);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 344);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 345);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 346);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 347);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 348);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 349);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 350);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 351);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 352);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 353);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 354);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 355);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 356);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 357);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 358);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 359);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 360);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 361);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 362);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 363);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 364);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 365);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 367);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 368);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 369);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 370);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 372);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 373);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 374);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 375);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 376);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 377);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 378);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 379);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 380);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 381);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 382);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 383);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 384);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 385);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 386);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 387);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 388);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 389);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 390);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 391);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 392);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 393);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 394);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 395);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 396);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 415);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 416);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 417);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 418);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 419);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 420);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 522);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 523);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 524);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 525);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 526);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 528);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 529);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 530);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 531);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 532);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 533);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 559);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 560);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 561);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 562);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 568);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 587);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 601);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 602);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 603);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 604);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 605);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 606);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (48, 641);

insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 271);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 398);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 399);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 400);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 401);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 402);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 403);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 404);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 405);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 406);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 407);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 408);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 409);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 410);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 411);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 412);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 413);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 414);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 421);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 422);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 423);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 426);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 427);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 428);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 429);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 430);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 431);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 432);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 433);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 434);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 435);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 436);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 437);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 438);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 439);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 440);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 441);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 442);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 443);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 444);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 445);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 446);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 447);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 448);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 449);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 450);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 451);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 452);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 453);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 454);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 455);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 456);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 457);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 458);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 459);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 460);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 461);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 462);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 463);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 464);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 465);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 466);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 467);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 468);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 469);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 470);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 471);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 472);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 473);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 474);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 475);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 476);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 477);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 478);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 479);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 480);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 481);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 482);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 483);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 484);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 485);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 486);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 487);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 488);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 489);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 490);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 491);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 492);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 493);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 494);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 495);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 496);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 497);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 498);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 499);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 500);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 501);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 502);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 503);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 504);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 505);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 506);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 507);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 508);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 509);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 510);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 512);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 513);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 514);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 515);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 516);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 517);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 518);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 519);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 521);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 527);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 534);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 535);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 536);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 537);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 538);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 540);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 544);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 545);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 546);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 563);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 564);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 570);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 571);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 585);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 586);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 588);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 592);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 593);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 594);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 595);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 596);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 597);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 598);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 599);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 600);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 611);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 645);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 656);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 659);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 554);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 567);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 615);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 616);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 627);
insert into turma_aluno (fk_turma_id, fk_aluno_id) values (49, 628);