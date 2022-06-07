SELECT
      ROUND(MIN(plan.value), 2) AS faturamento_minimo,
      ROUND(MAX(plan.value), 2) AS faturamento_maximo,
      ROUND(AVG(plan.value), 2) AS faturamento_medio,
      ROUND(SUM(plan.value), 2) AS faturamento_total
FROM
      SpotifyClone.subscriptions AS plan
      JOIN
      SpotifyClone.users AS user ON plan.id = user.subs_id;