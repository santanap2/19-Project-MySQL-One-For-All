SELECT
	MIN(P.price) AS `faturamento_minimo`,
    MAX(P.price) AS `faturamento_maximo`,
    ROUND(AVG(P.price), 2) AS `faturamento_medio`,
    SUM(P.price) AS `faturamento_total`
FROM SpotifyClone.plans AS P
INNER JOIN SpotifyClone.users AS U ON P.plan_id = U.plan_id;