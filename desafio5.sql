SELECT
S.name AS `cancao`,
COUNT(H.song_id) AS `reproducoes`
FROM SpotifyClone.songs AS S
INNER JOIN SpotifyClone.history AS H ON S.song_id = H.song_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;