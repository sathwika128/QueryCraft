select min(abs(p2.x-p1.x)) shortest
from point p1 
join point p2 on p1.x<p2.x or  p1.x>p2.x
