-- Top trending songs accounting for row updates
select *
from trending
order by rank, version_time desc
limit 1 by rank;

-- Michael Jackson danceability by albums
select s.album, avg(s.danceability) avg_danceability
from songs s
where has(s.artists, 'Michael Jackson')
group by s.album
order by avg_danceability desc;

-- Michael Jackson avg track duration by album
select s.album, avg(s.duration_ms) / 1000 as avg_track_dur_seconds
from songs s
where has(s.artists, 'Michael Jackson')
group by s.album;

-- Michael Jackson dance/tempo correlation by albums 
select s.album, s."name", s.danceability,  s.tempo,
from songs s
where has(s.artists, 'Michael Jackson')
order by s.album, s.track_number;

select s.album, corr(s.danceability, s.tempo)
from songs s
where has(s.artists, 'Michael Jackson')
group by s.album;