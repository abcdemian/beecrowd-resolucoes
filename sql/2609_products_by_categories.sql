select
    categories.name,
    sum(products.amount) as sum -- esse ALIAS já viria por padrão nesse caso
from products
inner join categories
    on products.id_categories = categories.id
group by 1
;
