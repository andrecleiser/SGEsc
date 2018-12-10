select t.id,
       ifnull(concat(t.descricao, ' - ', insert(t.hora_inicio, 3, 0, ':')), t.descricao) descricao,
       t.valor_sugerido,
       t.limite_alunos,
       count(ta.fk_aluno_id) qtd_alunos_turma
from turma t
     left join turma_aluno ta on (t.id = ta.fk_turma_id)
group by t.id, t.descricao, t.valor_sugerido, t.hora_inicio, t.limite_alunos
order by t.descricao, t.hora_inicio