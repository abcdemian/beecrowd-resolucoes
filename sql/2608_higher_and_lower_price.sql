-- Exercícios muito triviais e com algumas más práticas
-- como deixar duas colunas com o mesmo nome...
select
    max(price) as price, -- price_max
    min(price) as price -- price_min
from products
;
