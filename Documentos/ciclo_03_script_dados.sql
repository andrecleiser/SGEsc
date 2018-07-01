
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
