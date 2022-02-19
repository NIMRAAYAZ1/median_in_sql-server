use [portfolio project ]
create table median
(id int,
city varchar(21),
state varchar(25),
lat_n numeric(14,8),
lat_w numeric(14,8)
)
insert median values 
(1, 'lahore','punjab',31.52037,74.358747),
(2, 'karchi','sindh',24.8607,67.0011),
(3, 'islambad','punjab',33.6844,73.0479),
(4, 'quetta','punjab',27.1565,61.9750)
use [portfolio project ]
select * from dbo.median
order by lat_w

with kamal as 
(select *, ROW_NUMBER() over( order by  lat_w) as rowsss_asc,
ROW_NUMBER() over( order by  lat_w desc) as rowsss_desc
from  dbo.median)
--where id < 4)
select round(avg(lat_w),10) as avg from kamal 
where ABS(rowsss_asc - rowsss_desc) <= 1
