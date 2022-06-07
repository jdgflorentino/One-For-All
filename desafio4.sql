SELECT
    user.name AS usuario,
    IF(
        MAX(YEAR(playlist.hist)) = 2021,
        "Usuário ativo",
        "Usuário inativo"
    ) AS condicao_usuario
FROM
    SpotifyClone.users AS user
    JOIN
    SpotifyClone.playlists AS playlist ON user.id = playlist.user_id
GROUP BY
    user.name
ORDER BY
    usuario