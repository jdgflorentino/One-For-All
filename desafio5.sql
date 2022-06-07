SELECT
      track.track AS cancao,
      COUNT(playlist.track_id) AS reproducoes
FROM
      SpotifyClone.tracks AS track
      JOIN 
      SpotifyClone.playlists AS playlist ON track.id = playlist.track_id
      JOIN
      SpotifyClone.users AS user ON playlist.user_id = user.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;