SELECT
    user.name AS usuario,
    COUNT(playlist.track_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(track.duration / 60), 2) AS total_minutos
FROM
    SpotifyClone.users AS user
    INNER JOIN SpotifyClone.playlists AS playlist
    ON user.id = playlist.user_id
    INNER JOIN  SpotifyClone.tracks AS track 
    ON playlist.track_id = track.id
GROUP BY
    user.id
ORDER BY
    user.name;