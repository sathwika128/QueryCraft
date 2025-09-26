select viewer_id id
from views
group by 1,view_date having count(distinct article_id)>1 order by id
