select concat(name, '(', substr(occupation, 1, 1), ')')
from OCCUPATIONS
order by name;
              
select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.')
from OCCUPATIONS
group by occupation
order by count(occupation), occupation;
