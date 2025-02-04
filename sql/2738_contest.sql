select 
    candidate.name,
    round((2 * score.math + 3 * score.specific + 5 * score.project_plan) / 10, 2) as avg
from candidate
inner join score
    on candidate.id = score.candidate_id
order by 2 desc
;

/* 
POR ALGUM MOTIVO MISTERIOSO A QUERY ABAIXO NÃO É ACEITA COMO CORRETA SENDO QUE É LITERALMENTE A MESMA COISA,
A NÃO SER QUE NA MATEMÁTICA 2.0 OCORRA QUE ((1/10) * x) != (x / 10)
*/
select 
    candidate.name,
    round((1 / 10) * (2 * score.math + 3 * score.specific + 5 * score.project_plan), 2) as avg
from candidate
inner join score
    on candidate.id = score.candidate_id
order by 2 desc
;

-- Investigar melhor o porquê do PostgreSQL tratar os casos de forma diferente... ou é coisa da Beecrowd?
