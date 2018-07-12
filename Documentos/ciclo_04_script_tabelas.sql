alter table aluno
add column dia_vencimento bigint(2);

alter table frequencia
add column fk_turma_id bigint(10);

alter table frequencia
add constraint fk_turma
foreign key (fk_turma_id) references turma(id);

update frequencia set fk_turma_id = 46 where fk_turma_id is null;

alter table frequencia
drop foreign key fk_turma;

alter table frequencia
change column fk_turma_id fk_turma_id bigint(10) not null,
drop primary key,
add primary key (fk_aluno_id, data_frequencia, fk_turma_id);


alter table frequencia
add constraint fk_turma
  foreign key (fk_turma_id)
  references turma (id);