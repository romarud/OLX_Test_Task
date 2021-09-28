--Task 1.1

with posted_in_april as (select user_id from ads where to_char(server_date, 'YYYY-MM') = '2020-04' group by user_id)
select a.user_id from ads a
left join posted_in_april pa on a.user_id = pa.user_id
where pa.user_id is null and to_char(server_date, 'YYYY-MM') = '2020-03'
group by a.user_id;

--Task 1.2

select user_id
     , category_id
     , category_name
     , count(ad_id) ads
     , rank() over (partition by user_id order by count(ad_id) desc) category_rank
from ads
group by user_id, category_id, category_name
order by user_id, category_rank asc;