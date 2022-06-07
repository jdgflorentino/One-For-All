SELECT
      artistas.artist as artista,
      albuns.album as album,
      COUNT(user.id) as seguidores
FROM
      SpotifyClone.albums AS albuns
      JOIN
      SpotifyClone.artists AS artistas ON albuns.artist_id = artistas.id
      JOIN
      SpotifyClone.follow AS seguindo ON artistas.id = seguindo.artist_id
      JOIN
      SpotifyClone.users AS user ON seguindo.user_id = user.id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;