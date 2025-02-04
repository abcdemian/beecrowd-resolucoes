select
    products.id,
    products.name
from products
inner join categories
    on products.id_categories = categories.id
where categories.name ilike 'super%' 
-- um pouco bobinho, se colocar 'super %' com espaço da erro, embora faça mais sentido com espaço
-- caso contrario poderia retornar algo como 'superfluous' ou 'supernatural' que envolvem o prefixo
-- 'super' na string mas de forma diferente de 'super luxe', enfim...
;
