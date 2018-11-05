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
  
alter table pagamento
change column observacao varchar(100) null;
  
alter table `sgesc`.`pagamento` 
add unique index `idx_pagamento_unique` (`fk_aluno_id` asc, `fk_turma_id` asc, `ano` asc, `mes` asc);
  
alter table `sgesc`.`pagamento` 
add column `data_pagamento` date not null after `observacao`;

ALTER TABLE `sgesc`.`turma_aluno` 
ADD INDEX `fk_turma_id_idx` (`fk_turma_id` ASC);
