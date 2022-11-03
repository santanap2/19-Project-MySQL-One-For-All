SELECT
U.username AS `usuario`,
COUNT(H.song_id) AS `qt_de_musicas_ouvidas`,
ROUND(SUM(S.length)/60, 2) AS `total_minutos`
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.history AS H ON U.user_id = H.user_id
INNER JOIN SpotifyClone.songs AS S ON S.song_id = H.song_id
GROUP BY `usuario`
ORDER BY `usuario`;