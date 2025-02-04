-- Exercício chato pois envolve muitas joins e praticamente zero raciocínio além disso...

-- Tem um runtime error por tabela inexistente na query abaixo, depois procuro o problema

with vencimentos_empregado as (
    select
        emp_venc.matr,
        sum(vencimento.valor) as valor_total
    from emp_venc
    inner join vencimento
        on emp_venc.cod_venc = vencimento.cod_venc
    group by 1
),

descontos_empregado as (
    select
        emp_desc.matr,
        sum(desconto.valor) as valor_total
    from emp_desc
    inner join desconto
        on emp_desc.cod_desc = desconto.cod_desc
    group by 1
),

salario_empregado as (
    select
        empregado.matr,
        empregado.lotacao as cod_dep,
        empregado.lotacao_div as cod_divisao,
        coalesce(vencimentos_empregado.valor_total, 0) as total_vencimentos,
        coalesce(descontos_empregado.valor_total, 0) as total_descontos,
        coalesce(vencimentos_empregado.valor_total, 0)
        - coalesce(descontos_empregado.valor_total, 0) as salario
    from empregado
    left join vencimentos_empregado
        on empregado.matr = vencimentos_empregado.matr
    left join descontos_empregado
        on empregado.matr = descontos_empregado.matr
)


select
    departamento.nome as "Nome Departamento",
    count(distinct empregado.matr) as "Numero de Empregados",
    round(avg(salario_empregado.salario), 2) as "Media Salarial",
    round(max(salario_empregado.salario), 2) as "Maior Salario",
    round(min(salario_empregado.salario), 2) as "Menor Salario"
from departamento
--inner join divisao
    --on departamento.cod_dep = divisao.cod_dep
inner join salario_empregado
    on departamento.cod_dep = salario_empregado.cod_dep
    --and divisao.cod_divisao = salario_empregado.cod_divisao
group by 1
order by 3
;
