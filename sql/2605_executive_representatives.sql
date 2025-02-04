select
    products.name,
    providers.name
from products
inner join providers
    on products.id_providers = providers.id
inner join categories
    on products.id_categories = categories.id
where 1 = 1
and categories.id = 6 -- categories.name = 'executive'
;
