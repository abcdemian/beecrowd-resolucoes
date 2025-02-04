select
    subq.city
from (
    select 
        city,
        count(id) as qty_customers
    from customers
    group by 1
    having count(id) > 0
) as subq
;
