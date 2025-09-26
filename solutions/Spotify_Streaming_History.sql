with tmp as(
SELECT sh.user_id,sh.song_id,count(1) song_plays
FROM songs_weekly sh 
where listen_time <='08/04/2022 23:59:59'
group by 1,2
union all 
select user_id,song_id,song_plays
from songs_history
)
select user_id,song_id,sum(song_plays) song_count
from tmp 
group by 1,2 order by song_count desc
