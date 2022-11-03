SELECT U.username AS `usuario`,
IF(MAX(YEAR (H.played_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS `status_usuario`
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.history AS H ON U.user_id = H.user_id
GROUP BY `usuario`
ORDER BY `usuario`;