-- vyber POI po jednotlivych dnech do radku po dnu  - oddelene carkou

create view v_day_sequences as  select
   day,
   string_agg(cat::text,',') 
from
   visits 
group by
   day 
order by
   day;

-- nebo pro konkretni den z tabulky points_cat
SELECT 1
	,string_agg(cat::TEXT, ',')
FROM points_cat_tsp1
WHERE 1 = ANY (visits)
GROUP BY 1;
